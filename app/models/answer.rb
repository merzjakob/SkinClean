class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :patient_answers
end
