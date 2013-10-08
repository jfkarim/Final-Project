class Theme < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :user_themes
  has_many :users, through: :user_themes, source: :user
end
