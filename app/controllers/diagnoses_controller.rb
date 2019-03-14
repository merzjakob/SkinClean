class DiagnosesController < ApplicationController
  def new

  end

  def create
    @diagnosis = Diagnosis.new(user_id: current_user.id, recommendation: 'To', medical_assessment: "")
    if @diagnosis.save
      current_user.undiagnosed_answers.update_all(diagnosis_id: @diagnosis.id)
      redirect_to diagnoses_path
    else
      @questions = Question.all
      render "questions/index"
    end
  end

  def show
    @diagnosis = Diagnosis.find(params[:id])
  end

  def index
    @diagnoses = Diagnosis.all
  end

  def update
    identify_diagnosis
    @diagnosis.update(diagnosis_params)
    redirect_to diagnosis_path
  end

  def approve
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.status = "Diagnosed"
    @diagnosis.save
    redirect_to dashboard_path
  end

  def decline
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.status = "Pending"
    @diagnosis.save
    redirect_to dashboard_path
  end

  def edit
    identify_diagnosis
  end

  def destroy
    @diagnosis.destroy
    redirect_to diagnosis_path
  end

  private

  def identify_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

  def diagnosis_params
    params.require(:diagnosis).permit(:medical_assessment, :recommendation, :location, :status)
  end
end
