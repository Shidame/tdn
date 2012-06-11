class GameController < ApplicationController
  layout 'game'

  def home
    @user = current_user
    @city = @user.city
    @purchased_parcels = @city.parcels.where(purchased: true)
    @for_sale_parcels = @city.parcels.where(purchased: false)

  end
end
