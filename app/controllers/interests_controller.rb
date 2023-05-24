class InterestsController < ApplicationController

  def index
    @interests = Interest.all
    @interest = Interest.new
    @quiz = Quiz.new
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def create
    @interest = Interest.new(interest_params)
    @interest.user = current_user
    if @interest.save
      @interest.generate_questions
      redirect_to interests_path
    else
      @interests = Interest.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:user, :name, :priority)
  end


end
