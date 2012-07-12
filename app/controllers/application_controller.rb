class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def home
    @articles = Article.order("created_at DESC").last(5)
  end

  private

  def current_user
    # autolog with first user
    return @current_user = User.first

    return nil if cookies.signed[:token].blank?
    @current_user ||= User.find_by_token(cookies.signed[:token])
  end
end
