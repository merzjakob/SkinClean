class AddColumnStatusToDiagnoses < ActiveRecord::Migration[5.2]
  def change
      add_column :diagnoses, :status, :string, default: "pending"
    end
end
