class CreatePatientAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_answers do |t|
      t.references :answer, foreign_key: true
      t.references :diagnosis, foreign_key: true

      t.timestamps
    end
  end
end
