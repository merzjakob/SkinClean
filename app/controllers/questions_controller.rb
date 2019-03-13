class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!


  def index
    @questions = Question.all
    @patient_answer = PatientAnswer.new
  end

end
