class ParcelsController < GameController
	def buy
	  @city   = current_user.city
    @parcel = @city.parcels.find(params[:id])
    @parcel.purchased = true
    @parcel.save!
    redirect_to game_path
	end

  def show
    @city = current_user.city
    @parcel = @city.parcels.find(params[:id])
  end
end
