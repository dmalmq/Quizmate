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
    # question_per_interests = (8.to_f / Interest.all.count).ceil
    @questions = []

    8.times do
      interest_sample = Interest.all.sample
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
    redirect_to quiz_challenge_path(@quiz, @quiz.challenges.first)
  end

  private

  def quiz_params
    params.fetch(:quiz, {}).permit(:number_of_question) # Number of quizzes each day
  end
end
