class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      cookies.signed[:token] = user.token
    else
      flash[:email] = params[:session][:email]
      flash[:notice] = 'Wrong email and/or password'
    end
      redirect_to root_path
  end
  
  
  def destroy
    cookies.signed[:token] = nil
    redirect_to root_path
  end
end
