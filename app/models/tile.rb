class Tile < ActiveRecord::Base
  belongs_to :city
  belongs_to :building

  attr_accessible :land_type, :x, :y, :city

  def self.range(x_min, y_min, x_max, y_max)
    self.where('x >= ? AND x <= ? AND y >= ? AND y <= ?', x_min, x_max, y_min, y_max)
  end
end
