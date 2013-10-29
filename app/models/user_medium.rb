class UserMedium < ActiveRecord::Base

  attr_accessible :medium_id, :user_id

  validates :user_id, :medium_id, presence: true
  validates :medium_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :medium

end
