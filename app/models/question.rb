class Question < ApplicationRecord
  has_many :answers
  has_many :patient_answers
end
