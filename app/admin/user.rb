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

  index do
    selectable_column
    id_column
    column :name
    column :lastname
    column :email
    column :birthdate
    column :country
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

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
