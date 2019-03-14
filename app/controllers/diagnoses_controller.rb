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
