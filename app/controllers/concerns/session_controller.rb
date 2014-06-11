class SessionController < ApplicationController

   skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
  end

  def new
  end

  def create    
    user = User.find_by token: params[:token], email: params[:email]
    if user != nil
      session[:user_id] = user.id
      redirect_to index_path, :notice => "Logged in!"
    else
      redirect_to "/log_in", :notice => "Invalid Token"     
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end