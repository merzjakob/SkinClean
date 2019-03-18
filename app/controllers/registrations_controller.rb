class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if resource.doctor?
      edit_doctor_path(resource.doctor)
    else
      root_path
    end
  end
end
