# -*- encoding : utf-8 -*-
class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :description
      t.string :time
      t.integer :day
      t.float :price

      t.timestamps
    end
  end
end
