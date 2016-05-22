# -*- encoding : utf-8 -*-
require 'prawn'
require 'prawn/table'
class UserPdf < Prawn::Document
  def initialize(user, pack)
    super()
    @user = user
    @pack = pack
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
    text "#{@user.name}", size: 15, style: :bold, :align => :center

  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths

    text "\nCursos", size: 15, style: :bold, :align => :center
    table courses_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end

    text "\nVisistas Técnicas", size: 15, style: :bold, :align => :center
    table teches_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end

    text "\nPalestras", size: 15, style: :bold, :align => :center
    table lectures_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end

    text "\nProdutos", size: 15, style: :bold, :align => :center
    table extras_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
    if @pack != nil
      text "\nPacote - #{@pack.title}", size: 15, style: :bold, :align => :center
      text "\nDesconto = #{@pack.price}", size: 15, style: :bold, :align => :center
    end
  end

  def courses_rows
    [['#', 'Nome', 'Preço']] +
      @user.courses.map do |course|
      [course.id, course.title, course.price]
    end
  end

  def teches_rows
    [['#', 'Nome', 'Preço']] +
      @user.teches.map do |tech|
      [tech.id, tech.title, tech.price]
    end
  end

  def lectures_rows
    [['#', 'Nome', 'Preço']] +
      @user.lectures.map do |lecture|
      [lecture.id, lecture.title, lecture.price]
    end
  end

  def extras_rows
    [['#', 'Nome', 'Preço']] +
      @user.extras.map do |extra|
      [extra.id, extra.title, extra.price]
    end
  end
end
