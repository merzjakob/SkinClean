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
    @doctors = Doctor.where.not(latitude: nil, longitude: nil)

    if params[:query].present?
       @doctors = @doctors.where(city: params[:query])
     end

    @markers = @doctors.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { doctor: doctor }),
        image_url: helpers.asset_url('doctor-icon.jpg')
      }
    end
    @medicines = Medicine.all

  end

  def index
    if current_user.is_doctor?
      @diagnoses = Diagnosis.all
      # redirect_to diagnoses_path
    else
      @diagnoses = Diagnosis.where(user_id: current_user.id)
      # redirect_to diagnosis_path(params[:id])
   end
  end

  def update
    identify_diagnosis
    @diagnosis.update(diagnosis_params)
    redirect_to diagnoses_path
  end

  def approve
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.status = "Diagnosed"
    @diagnosis.save
    redirect_to edit_diagnosis_path(@diagnosis)
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
