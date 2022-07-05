class AddFieldToSubjectAreas < ActiveRecord::Migration[7.0]
  def change
    add_reference :subject_areas, :subject, foreign_key: true
  end
end
