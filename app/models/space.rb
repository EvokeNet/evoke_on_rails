class Space < ApplicationRecord
	has_many :space_memberships
  	has_many :users, through: :space_memberships
end
