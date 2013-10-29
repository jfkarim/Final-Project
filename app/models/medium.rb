class Medium < ActiveRecord::Base

  attr_accessible :name

  validates :name, presence: true

  has_many :user_media
  has_many :users, through: :user_media, source: :user

end
