class QuizzesController < ApplicationController
  def index
    @quizzes = policy_scope(Quiz)
    @interests = Interest.all
    @questions = Question.all
    @challenges = Challenge.all
    @total_challenges = 0
    @answered = 0
    @title = @interests.pluck(:name)
    @user = current_user
    @result = @interests.map do |interest|
      interest.corrected_percentage
    end
    stats(@interests)
  end

  def show
    @quiz = Quiz.find(params[:id])
    authorize @quiz
    @interests_with_question_counts = Interest.left_joins(:questions)
                                              .group('interests.id')
                                              .select('interests.name, COUNT(questions.id) AS question_count')
                                              .map { |interest| { interest.name => interest.question_count } }
    @quiz_interests = Interest.joins(:questions)
                              .where(questions: { quiz_id: @quiz.id })
                              .distinct
    @correct = @quiz.challenges.where(corrected: true).count
    @total = @quiz.challenges.count
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    authorize @quiz
    @quiz.number_of_question = 8
    @quiz.corrected_times = 0
    @quiz.user = current_user
    @quiz.save
    question_create
    redirect_to quiz_challenge_path(@quiz, @quiz.challenges.first)
  end

  private

  def quiz_params
    params.fetch(:quiz, {}).permit(:number_of_question) # Number of quizzes each day
  end

  def stats(interest)
    corrected_percentage = []
    interest.each do |interest|
      percentage = ((interest.challenges.where(corrected: true).count.to_f / interest.challenges.count) * 100).ceil
      corrected_percentage << { interest_name: interest.name, percentage: percentage }
    end
    corrected_percentage.sort_by! { |interest| interest[:percentage] }.reverse!
    @most_correct_interest = corrected_percentage.first[:interest_name]
    @least_correct_interest = corrected_percentage.last[:interest_name]
    @most_correct_percentage = corrected_percentage.first[:percentage]
    @least_correct_percentage = corrected_percentage.last[:percentage]
  end

  def question_create
    @questions = []
    8.times do
      interest_sample = Interest.where(user: current_user).sample
      all_questions = interest_sample.questions.order(streak: :asc)
      sampled_question = all_questions.sample
      @questions << sampled_question
    end
    if @questions.uniq.length == @questions.length
      nil
    else
      @questions.uniq!
      interest_sample = Interest.all.sample
      all_questions = interest_sample.questions.order(streak: :asc)
      sampled_question = all_questions.sample
      @questions << sampled_question
    end
    n = 0
    @questions.each do |question|
      n += 1
      challenge = Challenge.new(quiz: @quiz, question:, index_in_quiz: n)
      challenge.save
    end
  end
end
