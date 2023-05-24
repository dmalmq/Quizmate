class Quizzes::QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    questions = @quiz.questions
    index = questions.index(@question)
    @next_question = questions[index + 1]
  end

  def update
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    if @question.update(question_params)
      perform(@question)
      @next_question = @quiz.questions.where(answered: false).first # question not answred
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
      question.total_ask += 1
      question.last_ask = Time.now.strftime("%d/%m/%Y %H:%M")
      question.score += 1
      question.corrected = true
    else
      question.streak = 0
      question.corrected = false
      question.total_ask += 1
      question.last_ask = Time.now.strftime("%d/%m/%Y %H:%M")
    end
  end
end
