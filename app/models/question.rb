class Question < ApplicationRecord
  has_many :answers
  has_many :patient_answers

  def answered?(current_user)
    self.patient_answers.find_by_user_id(current_user.id).present?
  end
end
