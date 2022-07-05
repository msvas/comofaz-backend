class CreateInstructorSubjectTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :instructor_subject_topics do |t|
      t.references :instructor, null: false, foreign_key: true
      t.references :subject_topic, null: false, foreign_key: true
      t.timestamps
    end
  end
end
