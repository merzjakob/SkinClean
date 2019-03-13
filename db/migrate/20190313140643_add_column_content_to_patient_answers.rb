class AddColumnContentToPatientAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :patient_answers, :answer
    add_reference :patient_answers, :question
    add_reference :patient_answers, :user
    add_column :patient_answers, :content, :text
  end
end
