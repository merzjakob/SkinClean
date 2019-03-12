class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :picture, foreign_key: true
      t.text :medical_assessment
      t.text :recommendation
      t.string :location

      t.timestamps
    end
  end
end
