class Quizzes::QuestionsController < ApplicationController
  after_action :reset, only: :show
  def show
    @question = Question.includes([:interest]).find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @next_question = @quiz.questions.where(answered: false).first
    @answered_questions = @quiz.questions.reject{ |question| question.user_option.nil? }
  end

    def reset
      if !@next_question
            @quiz.questions.each do |question|
              question.answered = false
              question.score -= 1
              question.user_option = nil
              question.save
              # Reassign the question to the quiz
            end
  end
end
end
