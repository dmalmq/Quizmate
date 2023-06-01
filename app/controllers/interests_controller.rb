class InterestsController < ApplicationController
  def index
    @interests = policy_scope(Interest)
    @interest = Interest.new
    @quiz = Quiz.new
  end

  def show
    @interest = Interest.find(params[:id])
    authorize @interest
    @questions = @interest.questions.includes([:options]).reverse
  end

  def create
    @interest = Interest.new(interest_params)
    authorize @interest
    @interest.user = current_user
    if @interest.save
      @interest.generate_questions
      redirect_to interests_path
    else
      # @interests = Interest.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    authorize @interest
    @interest.destroy
    redirect_to interests_path, status: :see_other
  end

  private

  def interest_params
    params.require(:interest).permit(:user, :name, :priority, :photo)
  end
end
