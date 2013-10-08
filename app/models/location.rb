class Location < ActiveRecord::Base
  attr_accessible :city, :country

  validates :city, :country, presence: true

  has_many :user_locations
  has_many :users, through: :user_locations, source: :user
end
