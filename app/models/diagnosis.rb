class Diagnosis < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  belongs_to :picture
end
