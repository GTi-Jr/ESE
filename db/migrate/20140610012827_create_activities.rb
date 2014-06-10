class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :used_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
