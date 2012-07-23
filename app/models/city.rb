class City < ActiveRecord::Base
  belongs_to :user
  has_many :tiles
  has_many :buildings

  attr_accessible :name, :labroer, :city, :deben



  def generate_name(user)
  	"#{user.name.capitalize}'s city"
  end

  def to_s
  	"#{name}"
  end

  def generate_map
    fields = ['f', 'h', 'w', 'p', 'a']
    City.transaction do
      200.times do |x|
        50.times do |y|
          self.tiles.create(x: x, y: y, land_type: fields.sample)
        end
      end
    end
  end
end
