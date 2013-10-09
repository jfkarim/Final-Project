class GroupUser < ActiveRecord::Base
  attr_accessible :user_id, :group_id

  validates :user_id, :group_id, presence: true
  validates :group_id, uniqueness: {scope: :user_id}

end
