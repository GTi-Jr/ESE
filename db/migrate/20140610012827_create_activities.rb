class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :lecture_id
      t.integer :extra_id
      t.integer :tech_id
      t.timestamps
    end

    add_index :activities, :user_id
    add_index :activities, :course_id
    add_index :activities, :lecture_id
    add_index :activities, :extra_id
    add_index :activities, :tech_id
  end
end
