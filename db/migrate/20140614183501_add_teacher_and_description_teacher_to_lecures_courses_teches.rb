class AddTeacherAndDescriptionTeacherToLecuresCoursesTeches < ActiveRecord::Migration
  def change
    add_column :courses, :teacher, :string
    add_column :teches, :teacher, :string
    add_column :lectures, :teacher, :string
    add_column :courses, :teacher_description, :string
    add_column :teches, :teacher_description, :string
    add_column :lectures, :teacher_description, :string
  end
end
