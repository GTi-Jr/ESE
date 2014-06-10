class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.integer :serial
      t.string :password
      t.string :email
      t.string :phone
      t.string :course
      t.string :facebook
      t.boolean :has_paid

      t.timestamps
    end
  end
end
