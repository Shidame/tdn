class GameController < ApplicationController
  layout 'game'

  def home
    @user = current_user

  end
end
