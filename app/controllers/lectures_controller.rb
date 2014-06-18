class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  before_action :check_and_redirect

  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find(params[:id])
    @users = @lecture.users
  end

  def subscribe
    @lecture = Lecture.find(params[:id])
    check = checkTime(@lecture.time, @lecture.day)
      if check
      @lecture.users << current_user
      redirect_to :back, :notice => "Cadastrado =)"
    else
      redirect_to :back, :flash => {:error => "Está chocando horário com #{check.title}"}
    end
  end

  def unsubscribe
    @lecture = Lecture.find(params[:id])
    if @lecture.users.include?(current_user)
      @lecture.users.delete(current_user)
      redirect_to :back, :alert => "Égua mah tu não vai mais assistir isso"
    else
      redirect_to :back, :error => "Maxo tu nem tá nessa Palestra"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lecture_params
    params.require(:lecture).permit(:title, :description, :time, :day, :price)
  end
end
