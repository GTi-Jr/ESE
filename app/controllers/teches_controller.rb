# -*- encoding : utf-8 -*-
class TechesController < ApplicationController
  before_action :set_tech, only: [:show, :edit, :update, :destroy]
  before_action :check_and_redirect, except: [:show]
  def index
    @teches = Tech.all
  end

  def show
    if(admin_user_signed_in?)
      @tech = Tech.find(params[:id])
      @users = @tech.users

      respond_to do |format|
        format.html
        format.pdf do
          pdf = TechPdf.new(@tech)
          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        end
      end
    else
      check_and_redirect
    end
  end

  def subscribe
    @tech = Tech.find(params[:id])    
    check = checkTime(@tech.time, @tech.day)
    if @tech.users.count < @tech.limit
      if check
        @tech.users << current_user
        redirect_to :back, :notice => "Cadastrado =)"
      else
        redirect_to :back, :flash => { :error => "Está chocando horário com #{check.title}"}
      end
    else
      redirect_to :back, :flash => { :error => "Lotado" }
    end
  end

  def unsubscribe
    @tech = Tech.find(params[:id])
    if @tech.users.include?(current_user)
      @tech.users.delete(current_user)
      redirect_to :back, :alert => "Égua mah tu não vai mais assistir isso"
    else
      redirect_to :back, :error => "Maxo tu nem tá nessa Visita Técnica"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tech
    @tech = Tech.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tech_params
    params.require(:tech).permit(:title, :description, :day, :time, :limit, :price)
  end
end
