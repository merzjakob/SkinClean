class AddColumnDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_doctor, false
  end
end
