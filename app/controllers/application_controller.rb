class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	private
	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
  helper_method :current_user

  def loged_in?
    if current_user != nil
      true
    end
  end
  helper_method :loged_in?

  def check_and_redirect
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user == nil
      redirect_to "/log_in", :notice => "Increva-se e faça log in para ter acesso"
    end
  end
	helper_method :check_and_redirect


  def checkTime(time, day)
    order.each do |o|
      if !(o.is_a? Extra)
        if o.time == time && o.day == day
          return o
        end
      end
    end
    return true
  end


  def order
    @order = []
    @total = 0

    current_user.extras.each do |extra|
      @order << extra
    end

    current_user.lectures.each do |lecture|
      @order << lecture
    end

    current_user.courses.each do |course|
      @order << course
    end

    current_user.teches.each do |tech|
      @order << tech
    end

    @order.each do |o|
      @total = @total + o.price
    end

    @total = @total - discount
    return @order
  end
  helper_method :order


  private
  def discount
    packages = Package.order(:price)


    packages.each do |p|
      if ( current_user.extras.count >= p.extras ) && ( current_user.lectures.count >= p.lectures) && (current_user.courses.count >= p.courses) && (current_user.teches.count >= p.teches)
        @pack = p
      end
    end

    if @pack == nil
      return 0
    end

    return @pack.price
  end
end
