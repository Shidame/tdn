class DiscoveriesController < GameController
  def index
    @discoveries = current_user.discoveries
  end

  def create
    @technology = Technology.find(params[:technology_id])
    @discovery = current_user.discoveries.build(technology_id: params[:technology_id])

    if @discovery.save
      flash[:notice] = "You discovered #{@technology.name}."
      redirect_to discoveries_path
    else
      flash[:error] = "Technology not discovered"
      redirect_to discoveries_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
