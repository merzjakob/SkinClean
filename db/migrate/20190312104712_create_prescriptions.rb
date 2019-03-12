class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.references :diagnosis, foreign_key: true
      t.references :medicine, foreign_key: true

      t.timestamps
    end
  end
end
