class GameController < ApplicationController
  layout 'game'

  def home
    @user = current_user
    @city = @user.city


  end
end
