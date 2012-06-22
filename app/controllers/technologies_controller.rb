class TechnologiesController < GameController
  def index
    @technologies = Technology.find(:all, order: "depth ASC")

    @nb_tech_per_depth = Technology.group("depth").count(:depth)

    nb_technologies = @technologies.count

    @adj_matrix = Array.new(nb_technologies){Array.new(nb_technologies)}
  end
end
