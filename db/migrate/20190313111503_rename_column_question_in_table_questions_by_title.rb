class RenameColumnQuestionInTableQuestionsByTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question, :title
  end
end
