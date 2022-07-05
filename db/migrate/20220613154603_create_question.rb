class CreateQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.references :subject_topic, foreign_key: true
      t.text :description
      t.integer :status, :default => 0
      t.integer :solver_id
      t.timestamps
    end
  end
end
