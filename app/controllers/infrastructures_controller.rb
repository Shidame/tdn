class InfrastructuresController < GameController
  def buildable
    @city = current_user.city
    @parcel = @city.parcels.find(params[:parcel_id])
    @infrastructures = Infrastructure.all
  end

  def build
    @city   = current_user.city
    @parcel = @city.parcels.find(params[:parcel_id])
    @parcel.infrastructure = Infrastructure.find(params[:parcel][:infrastructure_id])
    @parcel.save!
    redirect_to game_path
  end

end
