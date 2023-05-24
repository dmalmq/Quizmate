class Quizzes::QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    questions = @quiz.questions
    index = questions.index(@question)
    @next_question = questions[index + 1]
  end

end
