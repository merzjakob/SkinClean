class PatientAnswersController < ApplicationController
  def new
  end

  def create
    @question = Question.find(params[:question_id])
    if params.include?(:photo)
      @patient_answer = PatientAnswer.new(question: @question, user: current_user, photo: params[:photo])
    else
      @patient_answer = PatientAnswer.new(question: @question, content: params[:content], user: current_user)
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
    params.require(:patient_answer).permit(:photo, :content)
  end

end
