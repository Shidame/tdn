class BuildingsController < GameController
  def create
    type    = BuildingType.find(params[:building_type_id])
    tile    = Tile.find(params[:tile_id])
    process = UserCreatesBuilding.new(current_user, type, tile)

    process.perform!

    render json: { building: process.building, tiles: process.building.tiles }
  end
end
