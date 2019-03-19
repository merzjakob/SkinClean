class AddCityToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :city, :string
  end
end
