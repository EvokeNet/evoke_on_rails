class SpaceMembershipsController < InheritedResources::Base

  def join
  	@space_membership = current_user.space_memberships.build(:space_id => params[:space_id])
  	if @space_membership.save
  		flash[:notice] = "You have joined this space"
  		redirect_to spaces_path
  	else
  		flash[:error] = "Unable to join this space"
  		redirect_to spaces_path
  	end
  end

  def unjoin
  	if @space_membership.destroy
  		flash[:notice] = "You have unjoined this space"
  		redirect_to spaces_path
  	else
  		flash[:error] = "Unable to unjoin this space"
  		redirect_to spaces_path
  	end
  end

  private

    def space_membership_params
      params.require(:space_membership).permit(:user_id, :space_id)
    end
end

