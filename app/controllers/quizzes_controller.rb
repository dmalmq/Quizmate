class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new
    questions = Question.order(score: :desc).limit(10) # Retrieve 10 questions in descending order of score
    @quiz.questions = questions # Assign the questions to the quiz
    @quiz.user = current_user
    @quiz.save
    questions.each do |question|
      question.score -= 1
      @quiz.questions << question # Reassign the question to the quiz
    end

    redirect_to quiz_quizzes_question_path(@quiz, @quiz.questions.first)
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
