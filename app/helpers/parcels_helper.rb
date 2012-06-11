module ParcelsHelper
  def land_name(parcel)
  	case parcel.land
  	when 0
  		name = "Water"
  	when 1
  		name = "Barren land"
  	when 2
  		name = "Grassland"
  	when 3
  		name = "Floodplain"
  	end
  end
end
