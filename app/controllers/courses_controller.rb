class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @users = @course.users
  end

  def subscribe
    @course = Course.find(params[:id])
      if @course.users.count < @course.limit && checkTime(@course.time)
      @course.users << current_user
      redirect_to courses_path, :notice => "Cadastrado =)"
    else
      redirect_to courses_path, :notice => "Programação lotado ou está chocando horário "
    end
  end

  def unsubscribe
    @course = Course.find(params[:id])
    if @course.users.include?(current_user)
      @course.users.delete(current_user)
      redirect_to courses_path, :notice => "Égua mah tu não vai mais assistir isso"
    else
      redirect_to courses_path, :notice => "Maxo tu nem tá nessa programação"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :time, :day, :limit, :price)
    end

    def checkTime(time)
      current_user.programs.each do |course|
        if course.time == time
          return false
        end
      end
      return true
    end
end
