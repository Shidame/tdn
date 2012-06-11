class Parcel < ActiveRecord::Base
  attr_accessible :city, :land_type, :purchased
  belongs_to :city

end
