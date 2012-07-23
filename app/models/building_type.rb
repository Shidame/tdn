class BuildingType < ActiveRecord::Base
  attr_accessible :name, :description, :width, :height, :land_type_required
  has_many :buildings
end
