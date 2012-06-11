class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.token = User.generate_token
    
    if @user.save
      cookies.signed[:token] = @user.token

      @user.assign_city
      @city = @user.city
      redirect_to game_path
    else
      render "new"
    end
  end
end
