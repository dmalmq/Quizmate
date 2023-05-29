class ChallengesController < ApplicationController
  def show
    @challenge = Challenge.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @next_question = @challenge.quiz.challenges.where(answered: false).first
    # redirect_to quiz_challenge_path(@challenge.quiz, @challenge)
  # else
  #   render :show, status: :unprocessable_entity
  end

  def update
    @challenge = Challenge.find(params[:id])
    # @question = Question.find(params[:id])
    if @challenge.update(challenge_params)
      perform(@challenge)
      @next_question = @challenge.quiz.challenges.where(answered: false).first # question not answred
      redirect_to quiz_challenge_path(@challenge.quiz, @challenge)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:user_option_id)
  end

  def perform(challenge)
    challenge.answered = true # marking the challenge as answered
    challenge.save

    if challenge.user_option_id == challenge.question.correct_option_id
      challenge.question.streak += 1
      challenge.question.total_asked += 1
      challenge.question.last_asked = Time.now.strftime("%d/%m/%Y %H:%M")
      challenge.score += 1
      challenge.corrected = true

    else
      challenge.question.streak = 0
      challenge.corrected = false
      challenge.question.total_asked += 1
      challenge.question.last_asked = Time.now.strftime("%d/%m/%Y %H:%M")
    end
    challenge.question.save
    challenge.save # saving the question with the updated attribute
  end
end
