class SpaceMembershipsController < InheritedResources::Base

  private

    def space_membership_params
      params.require(:space_membership).permit(:user_id, :space_id)
    end
end

