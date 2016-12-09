class SpacesController < InheritedResources::Base
    
  # GET /spaces/0
  # GET /spaces/0.json
  def show
    @space = Space.where(id: params[:id]).includes(:post).take
    @post = Post.new(space_id: params[:id])

    unless (@space.visibility.to_s == 'open') || (current_user.spaces.include? @space)
      flash[:notice] = "You are not currently a member of this private/secret space"
      redirect_to spaces_path
    end

  end

  # POST /users
  # POST /users.json
  def create
    @space = Space.new(space_params)
    @space.user_id = current_user.id

    respond_to do |format|
      if @space.save
        @space_membership = current_user.space_memberships.build(:space_id => @space.id)
        @space_membership.save

        format.html { redirect_to @space, notice: 'Space was successfully created.' }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def space_params
      params.require(:space).permit(:name, :description, :visibility)
    end
    
end

