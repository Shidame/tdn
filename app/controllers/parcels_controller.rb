class ParcelsController < GameController

  def index
    @city = current_user.city
    @buildable_parcels = @city.parcels.where(infrastructure_id: nil, purchased: true)
    @infrastructures = @city.infrastructures
    @available_parcels = @city.parcels.where(purchased: false)
  end

	def buy
	  @city   = current_user.city
    @parcel = @city.parcels.find(params[:parcel_id])
    @parcel.purchased = true
    @parcel.save!
    redirect_to game_path
	end

  def show
    @city = current_user.city
    @parcel = @city.parcels.find(params[:id])
  end
end
