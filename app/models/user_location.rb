class UserMedium < ActiveRecord::Base
  attr_accessible :location_id, :user_id

  validates :user_id, :location_id, presence: true
  validates :location_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :location
end
