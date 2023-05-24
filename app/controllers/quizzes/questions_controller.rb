class Quizzes::QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @next_question = @quiz.questions.where(answered: false).first
  end

  def update
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    if @question.update(question_params)
      @next_question = @quiz.questions.where(answered: false).first # question not answred
      perform(@question)
      if @next_question
        redirect_to quiz_quizzes_question_path(@quiz, @next_question)
      else
        redirect_to quiz_path(@quiz)
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
    question.answer = true
  end
end
