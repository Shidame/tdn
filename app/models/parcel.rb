class Parcel < ActiveRecord::Base
  belongs_to :city
  belongs_to :infrastructure

  attr_accessible :city, :land_type, :purchased

  def buildable?
    !infrastructure_id?
  end

end
