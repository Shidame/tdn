class Tile < ActiveRecord::Base
  belongs_to :city

  attr_accessible :field_type, :x, :y, :city
end
