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


end
