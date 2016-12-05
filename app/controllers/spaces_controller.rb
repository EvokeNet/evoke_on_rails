class SpacesController < InheritedResources::Base

  private

    def space_params
      params.require(:space).permit(:name, :description, :status, :join_policy)
    end
end

