class SpacesController < InheritedResources::Base
    
  # GET /spaces/0
  # GET /spaces/0.json
  def show
    @space = Space.where(id: params[:id]).includes(:post).take
    @new_post = Post.new(space_id: params[:id])
    puts @new_post.inspect
  end

  private

    def space_params
      params.require(:space).permit(:name, :description, :status, :join_policy)
    end
    
end

