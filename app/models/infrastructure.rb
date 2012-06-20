class Infrastructure < ActiveRecord::Base
  belongs_to :parcel
  has_many :cities, :through => :parcels

  attr_accessible :buildable_on, :description, :land_type, :name

  validates :name, uniqueness: true
end
