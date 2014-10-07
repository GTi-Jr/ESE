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


  def order(user)
    @order = []
    @total = 0

    user.extras.each do |extra|
      @order << extra
    end

    user.lectures.each do |lecture|
      @order << lecture
    end

    user.courses.each do |course|
      @order << course
    end

    user.teches.each do |tech|
      @order << tech
    end

    @order.each do |o|
      @total = @total + o.price
    end
    @pack = discount(user)
    @total = @total - @pack.price
    return @order
  end
  helper_method :order

  def discount(user)
    packages = Package.order(:price)


    packages.each do |p|
      if ( user.extras.count >= p.extras ) && ( user.lectures.count >= p.lectures) && (user.courses.count >= p.courses) && (user.teches.count >= p.teches)
        @pack = p
      end
    end

    if @pack == nil
      return 0
    end

    return @pack
  end
end
