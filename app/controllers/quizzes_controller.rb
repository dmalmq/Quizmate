class QuizzesController < ApplicationController

  def show
    @quizzes = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to quiz_path(@quiz)
    else
      @quizzes = Quiz.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:user)
  end

end
