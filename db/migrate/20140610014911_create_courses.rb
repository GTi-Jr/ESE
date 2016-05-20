# -*- encoding : utf-8 -*-
class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :time
      t.integer :day
      t.integer :limit
      t.float :price

      t.timestamps
    end
  end
end
