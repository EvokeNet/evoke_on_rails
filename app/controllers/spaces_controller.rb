class SpacesController < InheritedResources::Base

  # POST /users
  # POST /users.json
  def create
    @space = Space.new(space_params)
    @space.user_id = current_user.id

    respond_to do |format|
      if @space.save
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

