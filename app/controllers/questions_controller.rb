class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      perform(@question)
      @next_question = @quiz.questions.where(answered: false).first # question not answred
      if @next_question
        redirect_to quiz_question_path(@question.quiz, @next_question)
      else
        redirect_to quiz_path(@question.quiz)
      end
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_option_id)
  end

  def perform(question)
    question.answered = true # marking the question as answered
    question.save

    if question.user_option_id == question.correct_option_id
      question.streak += 1
      question.total_asked += 1
      question.last_asked = Time.now.strftime("%d/%m/%Y %H:%M")
      question.score += 1
      question.corrected = true
    else
      question.streak = 0
      question.corrected = false
      question.total_asked += 1
      question.last_asked = Time.now.strftime("%d/%m/%Y %H:%M")
    end
    question.save # saving the question with the updated attribute
  end


end
