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
    @quiz = Quiz.new(quiz_params)
    @quiz.number_of_question.times do
      question = Question.order(:score).first # Retrieve a random question from the database
      question.quiz_id = @quiz.id  # Assign the question to the quiz
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:number_of_question)
  end
end
