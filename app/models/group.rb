class Group < ActiveRecord::Base
  attr_accessible :admin_id, :description, :name

  validates :admin_id, :name, presence: true
end
