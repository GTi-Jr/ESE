# -*- encoding : utf-8 -*-
class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :title
      t.text :description
      t.integer :day
      t.string :time
      t.integer :limit
      t.float :price

      t.timestamps
    end
  end
end
