class User < ActiveRecord::Base

  /Email/
  after_save :password_notification

  /Validações/
  validates :name, :presence => true
  validates :email, :presence => true
  validates :age, :presence => true, :numericality => true
  validates :serial, :numericality => true
  validates :phone, :presence => true, :numericality => true
  validates :course, :numericality => false 
  validates :facebook, :presence => true

  /Auto Geração de Senha/
  before_create { generate_token(:password) }

  /Relacionamento - Banco de Dados/
  has_many :activities
  has_many :courses, through: :activities
  has_many :lectures, through: :activities
  has_many :extras, through: :activities
  has_many :teches, through: :activities

  /Método para Gerar Senha Randomica/
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(6,false)
    end while User.exists?(column => self[column])    
  end

  private
  def password_notification
    UserMailer.password_send(self).deliver


  end

end
