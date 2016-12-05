class CreateSpaceMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :space_memberships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :space, foreign_key: true

      t.timestamps
    end
  end
end
