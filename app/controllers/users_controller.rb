# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    if(admin_user_signed_in?)
      @user = User.find(params[:id])

      respond_to do |format|
        format.html
        format.pdf do
          pdf = UserPdf.new(@user, discount(@user))
          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        end
      end
    else
      check_and_redirect      
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Incrição feita com sucesso. Você irá receber por e-mail a sua senha' }
      else
        format.html { render action: 'new'}        
      end
    end
  end

  def recover
  end

  def recover_mail
    user = User.find_by email: params[:email]
    if user != nil
      user.password = SecureRandom.urlsafe_base64(6,false)
      user.save      
      redirect_to "/", :notice => "Um e-mail foi enviado com sua nova senha"
    else
      redirect_to :back, :alert => "E-mail não cadastrado"     
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :age, :serial, :password, :email, :phone, :course, :facebook, :has_paid)
  end
end
