class BuildingTypesController < GameController
  def index
    @buildings = BuildingType.all
  end
end
