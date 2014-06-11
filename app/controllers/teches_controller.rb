class TechesController < ApplicationController
  before_action :set_tech, only: [:show, :edit, :update, :destroy]

  def index
    @teches = Tech.all
  end

  def show
    @tech = Tech.find(params[:id])
    @users = @tech.users
  end

  def subscribe
    @tech = Tech.find(params[:id])
      if @tech.users.count < @tech.limit && checkTime(@tech.time)
      @tech.users << current_user
      redirect_to teches_path, :notice => "Cadastrado =)"
    else
      redirect_to teches_path, :notice => "Visita Técnica lotada ou está chocando horário "
    end
  end

  def unsubscribe
    @tech = Tech.find(params[:id])
    if @tech.users.include?(current_user)
      @tech.users.delete(current_user)
      redirect_to teches_path, :notice => "Égua mah tu não vai mais assistir isso"
    else
      redirect_to teches_path, :notice => "Maxo tu nem tá nessa Visita Técnica"
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

    def checkTime(time)
      current_user.programs.each do |tech|
        if tech.time == time
          return false
        end
      end
      return true
    end
end
