class DoctorsController < ApplicationController

  def edit
    @doctor = current_user.doctor
  end

  def update
  end


  def doctor_params
    params.require(:doctor).permit(:license, :introduction, :profile_picture)
  end
end
