class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def home
    @blogs = Blog.all
    @user = User.new
  end

  private

  def current_user
    return nil if cookies.signed[:token].blank?
    @current_user ||= User.find_by_token(cookies.signed[:token])
  end
end
