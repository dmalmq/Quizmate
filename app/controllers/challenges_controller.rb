class ChallengesController < ApplicationController
  def index
    @challenges = policy_scope(Challenge)
  end

  def show
    @challenge = Challenge.find(params[:id])
    authorize @challenge
    @quiz = Quiz.find(params[:quiz_id])
    @next_question = @challenge.quiz.challenges.where(answered: false).first
  end

  def update
    @challenge = Challenge.find(params[:id])
    authorize @challenge
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
    @user = current_user
    Question.where('streak >= ?', 3).update_all('streak = streak - 1')
    if challenge.user_option_id == challenge.question.correct_option_id
      challenge.question.streak += 1
      challenge.question.total_asked += 1
      challenge.question.last_asked = Time.now.strftime("%d/%m/%Y %H:%M")
      challenge.score += 1
      challenge.corrected = true
      @user.experience += 10
    else
      challenge.question.streak = 0
      challenge.corrected = false
      challenge.question.total_asked += 1
      challenge.question.streak = 0
      challenge.question.last_asked = Time.now.strftime("%d/%m/%Y %H:%M")
    end
    if @user.experience >= @user.total_exp
      @user.level += 1
      @user.total_exp += 100 * @user.level
    end
    @user.save
    challenge.question.save
    challenge.save # saving the question with the updated attribute
  end
end
