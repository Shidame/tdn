class TilesController < GameController

  def index
    @city = current_user.city
    if params.has_key?(:x) && params.has_key?(:y)
      x_start = params[:x].to_i
      y_start = params[:y].to_i
    else
      x_start = 1
      y_start = 1
    end

    max_x = @city.tiles.maximum("x")
    max_y = @city.tiles.maximum("y")

    width  = 35
    @width = width
    height = 15
    #@tiles = @city.tiles.where('x >= ?', x_start).where('x < ?', x_start+width).where('y >= ?', y_start ).where('y < ?', y_start+height).order('y ASC').order('x ASC').includes(:building => :building_type)
    @tiles = @city.tiles.range(x_start, y_start, x_start+width-1, y_start+height-1).order('y ASC').order('x ASC').includes(:building => :building_type)

    @current_x = x_start
    @current_y = y_start

    @next_x = x_start+1
    @next_y = y_start+1
    @prev_x = x_start-1
    @prev_y = y_start-1

    if @current_x == 1
      @prev_x = @current_x
    end
    if @current_y == 1
      @prev_y = @current_y
    end
    if @next_x > max_x
      @next_x = @current_x
    end
    if @next_y > max_y
      @next_y = @current_y
    end

  end
end
