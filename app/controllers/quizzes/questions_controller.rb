class Quizzes::QuestionsController < ApplicationController

  def show
    @question = Question.includes([:interest]).find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @next_question = @quiz.questions.where(answered: false).first
  end

end
