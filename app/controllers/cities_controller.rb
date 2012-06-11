class CitiesController < GameController
	def index
		@cities = City.all
	end
end
