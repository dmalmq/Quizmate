class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new
    number_of_question.times do
      question = Question.order(:score).reverse # Retrieve a reverse order by question score from the database
      question.score -= 1
      question.quiz = @quiz # Reassign the question to the quiz
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
