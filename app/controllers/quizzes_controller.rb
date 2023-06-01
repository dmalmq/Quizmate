class QuizzesController < ApplicationController
  def index
    @quizzes = policy_scope(Quiz)
    @interests = Interest.all
    @questions = Question.all
    @challenges = Challenge.all
    stats(@interests)
    @user = current_user
    @interests.sort_by { |interest| interest.challenges.count }.reverse!
    sampled_interests = @interests.take(5)
    @result = sampled_interests.map { |interest| interest.corrected_percentage }
    @result.delete(0)
    @title = []
    @title.concat(sampled_interests)
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
    @quiz.number_of_question = 4
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

  def stats(interests)
    corrected_percentage = []
    interests.each do |interest|
      if interest.challenges.count >= 1
        percentage = ((interest.challenges.where(corrected: true).count.to_f / interest.challenges.count) * 100).ceil
        corrected_percentage << { interest_name: interest.name, percentage: }
      end
    end
    @index_percentage = corrected_percentage.first
    corrected_percentage.sort_by! { |interest| interest[:percentage] }.reverse!
    @most_correct_interest = corrected_percentage.first[:interest_name]
    @least_correct_interest = corrected_percentage.last[:interest_name]
    @most_correct_percentage = corrected_percentage.first[:percentage]
    @least_correct_percentage = corrected_percentage.last[:percentage]
  end

  def question_create
    # not_asked = Interest.last.questions.where(last_asked: nil).count
    @questions = []
    # if not_asked == 10
    #   4.times do
    #     last_interest = Interest.last
    #     all_questions = last_interest.questions.order(streak: :asc)
    #     sampled_question = all_questions.sample
    #     @questions << sampled_question
    #   end
    #   4.times { take_question }
    # else
    #   8.times { take_question }
    # end
    take_presentation_question
    # if @questions.uniq.length != @questions.length
    #   @questions.uniq!
    #   take_question
    # end
    n = 0
    @questions.shuffle.each do |question|
      n += 1
      challenge = Challenge.new(quiz: @quiz, question:, index_in_quiz: n)
      challenge.save
    end
  end

  # def take_question
  #   interest_sample = Interest.all.sample
  #   all_questions = interest_sample.questions.order(streak: :asc)
  #   sampled_question = all_questions.sample
  #   @questions << sampled_question
  # end

  def take_presentation_question
    Interest.where(user: current_user).each do |interest|
      interest_question = interest.questions.order(streak: :asc).limit(1)
      @questions << interest_question.first
    end
  end
end
