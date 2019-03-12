class Answer < ApplicationRecord
  belongs_to :question
  has_many :patient_answers
end
