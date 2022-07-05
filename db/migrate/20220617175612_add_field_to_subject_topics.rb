class AddFieldToSubjectTopics < ActiveRecord::Migration[7.0]
  def change
    add_reference :subject_topics, :subject_area, foreign_key: true
  end
end
