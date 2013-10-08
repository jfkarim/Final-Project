class UserInfluence < ActiveRecord::Base
  attr_accessible :user_id, :influence_id

  validates :user_id, :influence_id, presence: true
  validates :influence_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :influence

end
