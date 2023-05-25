class QuizzesController < ApplicationController
  # before_action :reset_question, only: :show
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @interests_with_question_counts = Interest.left_joins(:questions)
                                              .group('interests.id')
                                              .select('interests.name, COUNT(questions.id) AS question_count')
                                              .map { |interest| { interest.name => interest.question_count } }
    @quiz_interests = Interest.joins(:questions)
                              .where(questions: { quiz_id: @quiz.id })
                              .distinct
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new
    questions = Question.order(score: :desc).limit(10) # Retrieve 10 questions in descending order of score
    @quiz.questions = questions # Assign the questions to the quiz
    @quiz.number_of_question = 10
    @quiz.corrected_times = 0
    @quiz.user = current_user
    @quiz.save
    questions.each do |question|
    #   question.answered = false
    #   question.score -= 1
        question.quiz = @quiz
        question.save
        # Reassign the question to the quiz
    end
    @quiz.save

    redirect_to quiz_question_path(@quiz, @quiz.questions.first)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:number_of_question) # Number of quizzes each day
  end

  def result
    @quiz = Quiz.find(params[:id])
    @quiz.total_points = @quiz.question.where(corrected: true).count
  end



end
