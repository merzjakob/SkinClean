class PatientAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :diagnosis, optional:true
  mount_uploader :photo, PhotoUploader
end
