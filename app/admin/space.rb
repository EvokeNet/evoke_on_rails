ActiveAdmin.register Space do

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

  menu priority: 3, label: proc{ I18n.t("active_admin.spaces") }

  permit_params :name, :description, :visibility, :user_id

  collection_action :new_space do
    link_to 'New Space', new_space_admin_space_path
  end

  collection_action :new_space do
      @space = Space.new
  end 

  index do
    selectable_column
    column :name
    column :description
    column :visibility
    column :user_id
    column :created_at
    actions
  end

  filter :name
  filter :visibility

  # form do |f|
  #   f.inputs "Admin Details" do
  #     f.input :name
  #     f.input :description
  #     f.input :visibility
  #     f.input :user_id
  #   end
  #   f.actions
  # end

end
