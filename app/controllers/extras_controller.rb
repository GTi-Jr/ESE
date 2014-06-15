class ExtrasController < ApplicationController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]
  before_action :check_and_redirect

  def index
    @extras = Extra.all
  end

  def show
    @extra = Extra.find(params[:id])
    @users = @extra.users
  end

  def buy
    @extra = Extra.find(params[:id])
      if @extra.users.count
      @extra.users << current_user
      redirect_to extras_path, :notice => "Comprado =)"
    else
      redirect_to extras_path, :error => "Esgotado mah"
    end
  end

  def unbuy
    @extra = Extra.find(params[:id])
    if @extra.users.include?(current_user)
      @extra.users.delete(current_user)
      redirect_to extras_path, :alert => "Égua mah tu não vai querer isso"
    else
      redirect_to extras_path, :error => "Maxo tu nem comprou essa xibata"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra
      @extra = Extra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extra_params
      params.require(:extra).permit(:title, :description, :limit, :price)
    end
end
