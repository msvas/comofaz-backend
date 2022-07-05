class CreateQuestionInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :question_instructors do |t|
      t.references :question, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true
      t.boolean :instructor_marked_solved, :default => false
      t.timestamps
    end
  end
end
