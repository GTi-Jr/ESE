class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :courses
      t.integer :lectures
      t.integer :teches
      t.integer :extras
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
