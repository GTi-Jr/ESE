# -*- encoding : utf-8 -*-
ActiveAdmin.register User do

  permit_params :name, :age, :serial, :password, :email, :phone, :course, :facebook, :has_paid

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
    column "Nome", :name
    column "Idade", :age
    column "Matricula", :serial
    column "Senha", :password
    column "Email", :email
    column "Telefone", :phone
    column "Curso", :course
    column "Facebook", :facebook
    column "Foi pago?", :has_paid
    column "Relatório" do |user|
      if user.has_pack?
        link_to "PDF", show_user_path(user.id, format: :pdf)
      else
        "Indisponível. Não escolheu pacote."
      end
    end
    actions
  end
end
