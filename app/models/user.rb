class User < ApplicationRecord
  include DeviseInvitable::Inviter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:student, :admin, :mentor, :teacher]

  # enum role: { student: 0, admin: 1, mentor: 2, teacher: 3}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png" 
  validates_attachment :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
  do_not_validate_attachment_file_type :image
  
  has_many :space_memberships
  has_many :spaces, through: :space_memberships
  
  def role?(r)
    role.include? r.to_s
  end

end
