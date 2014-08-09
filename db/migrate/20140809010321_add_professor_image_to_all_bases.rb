class AddProfessorImageToAllBases < ActiveRecord::Migration
  def change
    add_column :courses, :teacher_image, :string
    add_column :teches, :teacher_image, :string
    add_column :lectures, :teacher_image, :string
  end
end
