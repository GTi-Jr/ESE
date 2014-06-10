class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.string :title
      t.text :description
      t.integer :limit
      t.float :price

      t.timestamps
    end
  end
end
