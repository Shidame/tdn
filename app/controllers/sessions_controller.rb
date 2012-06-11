class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      cookies.signed[:token] = user.token
      redirect_to game_path
    else
      flash[:email] = params[:session][:email]
      flash[:error] = 'Wrong email and/or password'
      redirect_to root_path
    end
  end
  
  
  def destroy
    cookies.signed[:token] = nil
    redirect_to root_path
  end
end
