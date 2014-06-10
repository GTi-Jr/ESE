class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end

    add_index :activities, :user_id
    add_index :activities, :course_id
  end
end
