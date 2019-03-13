class QuestionsController < ApplicationController
  def show
    @question1 = Question.find(params[:id])
  end
end
