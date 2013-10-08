class Influence < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :user_influences
  has_many :users, through: :user_influences, source: :user
end
