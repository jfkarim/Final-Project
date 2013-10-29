class UserTheme < ActiveRecord::Base

  attr_accessible :user_id, :theme_id

  validates :user_id, :theme_id, presence: true
  validates :theme_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :theme

end
