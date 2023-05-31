class QuestionsController < ApplicationController

  def destroy
    @question = Question.find(params[:id])
    @interest = @question.interest
    authorize @question
    @question.destroy
    redirect_to interest_path(@interest), status: :see_other
  end

  def create
    @interest = Interest.find(params[:interest_id])
    authorize @interest
    @interest.generate_questions(params[:amount])
    redirect_to interest_path(@interest)
  end
end
