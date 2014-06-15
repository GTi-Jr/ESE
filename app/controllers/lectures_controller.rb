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
      if checkTime(@lecture.time)
      @lecture.users << current_user
      redirect_to lectures_path, :notice => "Cadastrado =)"
    else
      redirect_to lectures_path, :error => "Palestra lotada ou está chocando horário "
    end
  end

  def unsubscribe
    @lecture = Lecture.find(params[:id])
    if @lecture.users.include?(current_user)
      @lecture.users.delete(current_user)
      redirect_to lectures_path, :alert => "Égua mah tu não vai mais assistir isso"
    else
      redirect_to lectures_path, :error => "Maxo tu nem tá nessa Palestra"
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

    def checkTime(time)
      current_user.lectures.each do |course|
        if course.time == time
          return false
        end
      end
      return true
    end
end
