class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.text :description
      t.boolean :status
      t.integer :join_policy

      t.timestamps
    end
  end
end
