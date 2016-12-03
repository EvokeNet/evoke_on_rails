# ActiveAdmin.register_page "Invite Users" do
#     action_item do
#         link_to 'Invite New User', admin_invite_users_new_invitation_path
#     end

#     page_action :new_invitation do
#         @user = User.new
#         end 

#     page_action :send_invitation, :method => :post do
#         @user = User.invite!(params[:user], current_user)
#         if @user.errors.empty?
#             flash[:success] = "User has been successfully invited." 
#             redirect_to admin_invite_users_path 
#         else
#             messages = @user.errors.full_messages.map { |msg| msg }.join
#             flash[:error] = "Error: " + messages
#             redirect_to new_invitation_admin_users_path
#         end
#     end
# end