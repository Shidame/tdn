class Building < ActiveRecord::Base
  belongs_to :building_type
  belongs_to :city
  has_many :tiles
  attr_accessible :city_id, :building_type_id
end
