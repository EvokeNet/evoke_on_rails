class AddBasicFieldsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :lastname, :string
  	add_column :users, :birthdate, :date
  	add_column :users, :bio, :text
  	add_column :users, :country, :string
  	add_column :users, :language, :string
  	# add_column :users, :image, :text
  end
end
