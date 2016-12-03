ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu priority: 2, label: proc{ I18n.t("active_admin.users") }

  permit_params :name, :lastname, :email, :role, :bio, :birthdate, :country, :password, :password_confirmation

  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end

  collection_action :new_invitation do
      @user = User.new
  end 

  collection_action :send_invitation, :method => :post do
      @user = User.invite!(params[:user], current_user)
      if @user.errors.empty?
          flash[:success] = "User has been successfully invited." 
          redirect_to admin_users_path 
      else
          messages = @user.errors.full_messages.map { |msg| msg }.join
          flash[:error] = "Error: " + messages
          redirect_to new_invitation_admin_users_path
      end
  end

  index do
    selectable_column
    column :name
    column :lastname
    column :email
    column :birthdate
    column :country
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :role
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :lastname
      f.input :email
      f.input :birthdate
      # f.country_select :country
      f.input :country, priority_countries: ["BR", "US", "CO"]
      f.input :role
      f.input :bio
      # f.input :password
      # f.input :password_confirmation
      # f.input :current_password
    end
    f.actions
  end

end
