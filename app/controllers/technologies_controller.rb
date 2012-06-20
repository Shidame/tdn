class TechnologiesController < GameController
  def index
    @technologies = Technology.all
  end
end
