# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

  /Email/
  after_save :password_notification, :if => :password_changed?

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

  /Checa se o usuário possui algum pacote/
  def has_pack?
    packages = Package.order(:price)
    @pack = nil
    packages.each do |p|
      if ( extras.count >= p.extras ) && ( lectures.count >= p.lectures) && (courses.count >= p.courses) && (teches.count >= p.teches)
        @pack = p
      end
    end

    return !@pack.nil?
  end

  /Método para Gerar Senha Randomica/
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(6,false)
    end while User.exists?(column => self[column])
  end

  private
  def password_notification
    UserMailer.password_send(self).deliver_now
  end

end
