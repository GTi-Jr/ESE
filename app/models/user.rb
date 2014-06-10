class User < ActiveRecord::Base

  //Validações
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :age, :presence => true, :numericality => true
  validates :serial, :presence => true, :numericality => true
  validates :password, :presence => true
  validates :phone, :presence => true, :numericality => true
  validates :course, :presence => true, :numericality => false 
  validates :facebook, :presence => true
  validates :has_paid, :presence => true

  //Auto Geração de Senha
  before_create { generate_token(:password) }

  // Relacionamento - Banco de Dados
  has_many :activities
  has_many :classes, through: :activities
  has_many :lectures, through: :activities
  has_many :extras, through: :activities
  has_many :techs, through: :activities

  //Método para Gerar Senha Randomica
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(6,false)
    end while User.exists?(column => self[column])    
  end

end
