class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.token = User.generate_token
    
    if @user.save
      cookies.signed[:token] = @user.token
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
