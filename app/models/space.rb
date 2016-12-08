class Space < ApplicationRecord
  belongs_to :user
  has_many :space_memberships
  has_many :users, through: :space_memberships

  enum visibility: [:open, :closed, :secret]
end
