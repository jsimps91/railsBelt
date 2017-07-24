class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_login
    if session[:user_id].nil?
      redirect_to '/'
    end
  end
end
