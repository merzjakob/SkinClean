class PatientAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :diagnosis, optional: true
  mount_base64_uploader :photo, PhotoUploader
  # mount_base64_uploader :image, ImageUploader

  # def photo_present
  #   if PatientAnswer.exists?(photo: photo)
  #     self.photo
  #   end
  # end
end
