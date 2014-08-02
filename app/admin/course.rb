ActiveAdmin.register Course do

  permit_params :title, :description, :time, :day, :limit, :price, :image, :teacher, :teacher_description
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column "Titulo", :title
    column "Descrição", :description
    column "Tempo", :time
    column "Dia", :day
    column "Limite", :limit
    column "Preço", :price
    column "Link Imagem", :image
    column "Professor", :teacher
    column "Descrição do Professor", :teacher_description
    column "Relatório" do |course|
      link_to "PDF", "../course/#{course.id}.pdf"
    end
    actions
  end  
end
