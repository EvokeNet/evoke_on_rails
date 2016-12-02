class InvitationsController < Devise::InvitationsController
   def create
      	if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
	      redirect_to :back
	    else
	      redirect_to root_path
	    end
   end
end