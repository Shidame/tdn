class UserCreatesBuilding
  attr_reader :user, :building_type, :building, :tiles

  def initialize(user, building_type, tile)
    @user = user
    @type = building_type
    @tile = tile
  end


  def perform!
    User.transaction do
      raise Building::NotAvalaibleForUser unless user_has_access_to_building_type?
      raise Tile::NotAvailable unless occupied_tiles_are_available?
      raise Tile::NotOnBoard unless occupied_tiles_are_on_board?

      @building = create_building!
      self
    end
  end


  protected

  def occupied_tiles_are_on_board?
    occupied_tiles.size == @type.width*@type.height
  end

  def occupied_tiles_are_available?
    occupied_tiles.all? do |tile|
      tile.building_id == nil
    end
  end


  def user_has_access_to_building_type?
    @type.in?(@user.available_building_types)
  end


  def create_building!
    building = Building.new

    building.building_type = @type
    building.city_id = @tile.city_id

    building.save!

    occupied_tiles.update_all(building_id: building.id)

    building
  end


  def occupied_tiles
    @tiles ||= (
      if @type.width == 1 and @type.height == 1
        #tiles = [ @tile ]
        Tile.where(id: @tile.id)
      else
        x_max = @tile.x + @type.width - 1
        y_max = @tile.y + @type.height - 1
        Tile.range(@tile.x, @tile.y, x_max, y_max)
      end
    )
  end
end
