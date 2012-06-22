class DiscoveriesController < GameController
  def index
    @discoveries = current_user.discoveries
  end

  def create
    @technology = Technology.find(params[:technology_id])

    prerequisites = @technology.parent_ids
    known_prerequisites = current_user.discoveries.map(&:technology_id)
    # check if current_user can discover the technology
    # if he has discovered the previous technologies
    if !prerequisites.empty? && !(prerequisites - known_prerequisites).empty?
      flash[:error] = "You dont have all the prerequisites"
      redirect_to discoveries_path
    else
      @discovery = current_user.discoveries.build(technology_id: params[:technology_id])

      if @discovery.save
        flash[:notice] = "You discovered #{@technology.name}."
        redirect_to discoveries_path
      else
        flash[:error] = "Technology not discovered"
        redirect_to discoveries_path
      end
    end
  end
end
