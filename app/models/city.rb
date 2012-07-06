class City < ActiveRecord::Base
  belongs_to :user
  has_many :parcels
  has_many :infrastructures, :through => :parcels
  has_many :tiles

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

  def generate_map
    fields = ['f', 'h', 'w', 'p', 'a']
    City.transaction do
      200.times do |x|
        50.times do |y|
          self.tiles.create(x: x, y: y, field_type: fields.sample)
        end
      end
    end
  end
end
