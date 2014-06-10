class Tech < ActiveRecord::Base
  /Validações/
  validates :title, :presence => true
  validates :description, :presence => true
  validates :time, :presence => true
  validates :day, :presence => true, :numericality => true
  validates :limit, :presence => true, :numericality => true
  validates :price, :presence => true, :numericality => true
  
  /Relacionamentos - Banco de Dados/
  has_many :users, through: :activities
  has_many :activities
end
