class PatientAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :diagnosis
end
