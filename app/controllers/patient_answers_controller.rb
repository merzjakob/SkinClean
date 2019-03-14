class PatientAnswersController < ApplicationController
  def new
    # @patient_answer = PatientAnswer.new
  end

  def create
    @question = Question.find(params[:question_id])
    if patient_answer_params.include?(:photo)
      # binding.pry
      @patient_answer = PatientAnswer.new(question: @question, user: current_user, photo: patient_answer_params[:photo])
    else
      @patient_answer = PatientAnswer.new(question: @question, content: patient_answer_params[:content], user: current_user)
    end
    if @patient_answer.save
      redirect_to questions_path
    else
      flash[:alert] = "Please provide an answer"
      render :index
    end
  end

  private

  def patient_answer_params
    params.require(:patient_answer).permit(:photo, :photo_cache, :content)
  end
end
