class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :description
      t.text :risk
      t.integer :price_per_unit

      t.timestamps
    end
  end
end
