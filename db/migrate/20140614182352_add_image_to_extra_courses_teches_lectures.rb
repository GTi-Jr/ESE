class AddImageToExtraCoursesTechesLectures < ActiveRecord::Migration
  def change
    add_column :extras, :image, :string
    add_column :courses, :image, :string
    add_column :teches, :image, :string
    add_column :lectures, :image, :string
  end
end
