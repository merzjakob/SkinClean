class PatientAnswer < ApplicationRecord
  belongs_to :question, :user
  belongs_to :diagnosis, optional:true
end
