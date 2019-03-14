class Diagnosis < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  has_many :patient_answers
  has_many :answers, through: :patient_answers
  has_many :medicines, through: :prescriptions

  validates :medical_assessment, :recommendation, presence: true
end
