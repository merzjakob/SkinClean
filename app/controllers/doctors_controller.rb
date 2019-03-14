class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

  end

  def update
  end

  def edit
  end


  def doctor_params
    params.require(:doctor).permit(:license, :introduction, :profile_picture)

  end
end
