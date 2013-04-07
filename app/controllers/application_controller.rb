class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_required

  private
  def login_required
  	unless logged_in? 
  		redirect_to login_path, :notice => 'Please Log In'
  	end
  end

  def logged_in?
  	true if current_user
  end

  helper_method :logged_in?

  def current_user
  	@current_user ||= Musician.find(session[:musician_id]) if session[:musician_id]
  end

  helper_method :current_user

  def login(musician)
  	session[:musician_id] = @musician.id
  end

  def logout
  	session[:musician_id] = nil
  end

end
