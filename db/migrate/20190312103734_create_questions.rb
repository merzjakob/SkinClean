class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.boolean :multiple_choice

      t.timestamps
    end
  end
end
