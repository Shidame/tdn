class Infrastructure < ActiveRecord::Base
  has_many :parcels
  has_many :cities, :through => :parcels

  attr_accessible :buildable_on, :description, :land_type, :name

  validates :name, uniqueness: true
end
