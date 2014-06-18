class SessionController < ApplicationController

   skip_before_filter :verify_authenticity_token, :only => [:create]
   before_action :check_and_redirect, :only => [:index]

  def index
    @lectures = Lecture.all.count
    @courses = Course.all.count
    @teches = Tech.all.count

  end

  def new
  end

  def create    
    user = User.find_by password: params[:password], email: params[:email]
    if user != nil
      session[:user_id] = user.id
      redirect_to index_path, :notice => "Logged in!"
    else
      redirect_to "/log_in", :notice => "Invalid Password"     
    end
  end

  def destroy
    session[:user_id] = nil
    session[:price] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end