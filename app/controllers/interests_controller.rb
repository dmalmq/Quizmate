require "open-uri"

class InterestsController < ApplicationController
  def index
    @interests = policy_scope(Interest)
    @interest = Interest.new
    # @all_interest = Interest.all
    @quiz = Quiz.new
    if Quiz.where(user: current_user).count >= 1
      stats(@interests)
    end
  end

  def show
    @interest = Interest.find(params[:id])
    authorize @interest
    @questions = @interest.questions.includes([:options]).reverse
  end

  def update
    @interest = Interest.find(params[:id])
    authorize @interest
    @interest.update(interest_params)
    redirect_to interest_path(@interest)
  end

  def create
    @interest = Interest.new(interest_params)
    file = URI.open("https://source.unsplash.com/1600x900/?#{interest_params[:name]}")
    @interest.photo.attach(io: file, filename: "#{interest_params[:name]}.jpg", content_type: 'image/jpg')
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

  def stats(all_interest)
    corrected_percentage = []
    if all_interest == []
      return
    else
      all_interest.each do |interest|
        if interest.challenges.count >= 1
          percentage = ((interest.challenges.where(corrected: true).count.to_f / interest.challenges.count) * 100).ceil
          corrected_percentage << { interest_name: interest.name, percentage: percentage }
        end
      end
      corrected_percentage.sort_by! { |interest| interest[:percentage] }.reverse!
      @most_correct_interest = corrected_percentage.first[:interest_name]
      @least_correct_interest = corrected_percentage.last[:interest_name]
      @most_correct_percentage = corrected_percentage.first[:percentage]
      @least_correct_percentage = corrected_percentage.last[:percentage]
    end
  end
end
