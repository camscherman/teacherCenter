class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Teacher.find_by(id: session[:user_id])
  end

  helper_method :current_user
  helper_method :user_signed_in?

  def user_signed_in?
    if session[:user_id].present? && current_user.nil?
      session[:user_id] = nil
    end
    session[:user_id].present?
  end

  private
  def authenticate_user!
    if !user_signed_in?
      redirect_to root_path
    end
  end
end
