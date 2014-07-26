class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :check_and_redirect

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @users = @course.users

    respond_to do |format|
      format.html
      format.pdf do
        pdf = CoursePdf.new(@course)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def subscribe
    @course = Course.find(params[:id])
    check = checkTime(@course.time, @course.day)
    if @course.users.count < @course.limit
      if check == true
        @course.users << current_user
        redirect_to :back, :notice => "Cadastrado =)"
      else
        redirect_to :back, :flash => { :error => "Está chocando horário com #{check.title}"}
      end
    else
      redirect_to :back, :flash => { :error => "Lotado" }
    end
  end

  def unsubscribe
    @course = Course.find(params[:id])
    if @course.users.include?(current_user)
      @course.users.delete(current_user)
      redirect_to :back, :alert => "Égua mah tu não vai mais assistir isso"
    else
      redirect_to :back, :flash => { :error => "Maxo tu nem tá nessa programação" }
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
end
