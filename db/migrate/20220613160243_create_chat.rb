class CreateChat < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :question_instructor, foreign_key: true
      t.integer :status, :default => 0
      t.timestamps
    end
  end
end
