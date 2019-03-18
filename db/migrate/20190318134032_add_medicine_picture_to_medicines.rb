class AddMedicinePictureToMedicines < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :medicine_picture, :string
  end
end
