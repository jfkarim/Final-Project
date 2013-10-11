class Like < ActiveRecord::Base
  attr_accessible :likeable_id, :likeable_type, :user_id, :content

  validates :user_id, :likeable_id, :likeable_type, presence: true
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}

  belongs_to :likeable, polymorphic: true

  belongs_to :user
  belongs_to :post
  belongs_to :photo
  belongs_to :comment

end
