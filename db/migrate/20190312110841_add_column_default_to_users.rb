class AddColumnDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :doctor, false
  end
end
