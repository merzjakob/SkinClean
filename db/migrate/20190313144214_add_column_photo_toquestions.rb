class AddColumnPhotoToquestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :photo, :boolean
    add_column :patient_answers, :photo, :string
  end
end
