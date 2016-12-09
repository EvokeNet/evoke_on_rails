class SpaceMembershipsController < InheritedResources::Base

  def join
  	@space_membership = current_user.space_memberships.build(:space_id => params[:id])
    
  	if @space_membership.save
  		flash[:notice] = "You have joined this space"
  		redirect_to spaces_path
  	else
  		flash[:error] = "Unable to join this space"
  		redirect_to spaces_path
  	end
  end

  def leave
	  @space_membership = current_user.space_memberships.find_by(:space_id => params[:id])

  	if @space_membership.destroy
  		flash[:notice] = "You have unjoined this space"
  		redirect_to spaces_path
  	else
  		flash[:error] = "Unable to unjoin this space"
  		redirect_to spaces_path
  	end
  end

 #  	def join
	#   @space = SpaceMemberships.find params[:id]
	#   current_user.update_attribute(:space_id, @space.id)
	#   redirect_to spaces_path
	# end

	# def leave
	#   @space = SpaceMemberships.find params[:id]
	#   current_user.update_attribute(:space_id, nil)
	#   redirect_to spaces_path
	# end

  # DELETE /space_memberships/1
  # DELETE /space_memberships/1.json
  # def destroy
  #   @space_membership.destroy
  #   respond_to do |format|
  #     format.html { redirect_to spaces_path, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def space_membership_params
      params.require(:space_membership).permit(:user_id, :space_id)
    end
end

