# -*- encoding : utf-8 -*-
require 'prawn/table'
class CoursePdf < Prawn::Document
  def initialize(course)
    super()
    @course = course
    @users = course.users
    header
    text_content
    table_content
  end
 
  def header
    #This inserts an image in the pdf file and sets the size of the image
    #image "#{Rails.root}/app/assets/images/logo.png", width: 530, height: 150
  end
 
  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50
 
    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it    
    text "#{@course.title}", size: 15, style: :bold, :align => :center
 
  end
 
  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end
 
  def product_rows
    [['#', 'Name', 'Email']] +
      @users.map do |user|
      [user.id, user.name, user.email]
    end
  end
end
