class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @quiz.result
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.number_of_question.times do
      question = Question.order(:Question.score).reverse # Retrieve a reverse order by question score from the database
      question.score -= 1
      question.quiz_id = @quiz.id  # Reassign the question to the quiz
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:number_of_question) # Number of quizzes each day
  end

  def result
    @quiz = Quiz.find(params[:id])
    @quiz.total_points = @quiz.question.where(correct: true).count
  end
end
