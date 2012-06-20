class City < ActiveRecord::Base
  belongs_to :user
  has_many :parcels
  has_many :infrastructures, :through => :parcels

  attr_accessible :name, :labroer, :city, :deben



  def generate_name(user)
  	"#{user.name.capitalize}'s city"
  end

  def to_s
  	"#{name}"
  end

  def generate_first_parcels
    City.transaction do

      (1..5).each do |i|
        Parcel.create!(land_type: 'grassland', city: self, purchased: true)
      end
      (1..2).each do |i|
        Parcel.create!(land_type: 'floodplain', city: self, purchased: true)
      end

      Parcel.create!(land_type: 'water', city: self)
      Parcel.create!(land_type: 'arid land', city: self)
      Parcel.create!(land_type: 'grassland', city: self)
      Parcel.create!(land_type: 'floodplain', city: self)
    end
  end
end
