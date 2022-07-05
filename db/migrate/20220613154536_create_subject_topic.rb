class CreateSubjectTopic < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_topics do |t|
      t.string :name
      t.timestamps
    end
  end
end
