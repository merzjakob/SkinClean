class AddBooleanToquestions < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :photo, false
  end
end
