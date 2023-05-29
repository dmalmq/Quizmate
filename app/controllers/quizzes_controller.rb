class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    @interests = Interest.all
    @questions = Question.all
    @challenges = Challenge.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.number_of_question = 10
    @quiz.corrected_times = 0
    @quiz.user = current_user
    @quiz.save
    questions = Question.order(streak: :desc).limit(10)
    questions.each do |question|
      challenge = Challenge.new(quiz: @quiz, question: question)
      challenge.save
    end
    redirect_to quiz_challenge_path(@quiz, @quiz.challenges.first)
  end

  private

  def quiz_params
    params.fetch(:quiz, {}).permit(:number_of_question) # Number of quizzes each day
  end

  def result
    @quiz = Quiz.find(params[:id])
    @quiz.total_points = @quiz.question.where(corrected: true).count
  end
end
