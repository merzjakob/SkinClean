class DiagnosesController < ApplicationController
  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    @diagnosis.doctor_id = current_user.id
    if @diagnosis.save
      redirect_to new_diagnosis_path(@diagnosis)
    else
      render :new
    end
  end

  def show
    @diagnosis = Diagnosis.find(params[:id])
  end

  def index
    @diagnosis = Diagnosis.all
  end

  private

  def flat_params
    params.require(:diagnosis).permit(:medical_assessment, :recommendation, :location)
  end
end
