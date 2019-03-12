class CreateReferenceToDiagnosis < ActiveRecord::Migration[5.2]
  def change
    remove_reference :diagnoses, :picture
    add_reference :pictures, :diagnosis
  end
end
