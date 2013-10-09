class Wall < ActiveRecord::Base
  attr_accessible :owner_id

  belongs_to :user, class_name: "User", primary_key: :id, foreign_key: :owner_id
  belongs_to :event, class_name: "Event", primary_key: :id, foreign_key: :owner_id
  belongs_to :group, class_name: "Group", primary_key: :id, foreign_key: :owner_id

  has_many :posts
end
