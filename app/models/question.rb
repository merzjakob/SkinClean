class Question < ApplicationRecord
  has_many :answers
  has_many :patient_answers

  def user_answer(current_user)
    patient_answers.find_by_user_id(current_user.id)
  end
end
