class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.text :description, null: false
      t.integer :user_id, null: false
      t.integer :comment_id, null: false 
      t.timestamps
    end
  end
end
