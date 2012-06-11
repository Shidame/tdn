class City < ActiveRecord::Base
  belongs_to :user
  has_many :parcels
  attr_accessible :name



  def generate_name(user)
  	"#{user.name.capitalize}'s city"
  end

  def to_s
  	"#{name}"
  end

  def generate_parcels
    City.transaction do
      # create 10 Water parcels
      (1..10).each do |i|
        Parcel.create!(land_type: 'water', city: self)
      end
      # create 30 Baren lands
      (1..30).each do |i|
        Parcel.create!(land_type: 'barren land', city: self)
      end
      # create 15 grassland parcels
      (1..15).each do |i|
        Parcel.create!(land_type: 'grassland', city: self)
      end
      # create 10 floodplains
      (1..10).each do |i|
        Parcel.create!(land_type: 'floodplain', city: self)
      end
    end
  end
end
