class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :user_id, :content

  validates :user_id, :commentable_id, :commentable_type, :content, presence: true

  belongs_to :commentable, polymorphic: true

  belongs_to :user
  belongs_to :post
  belongs_to :photo
  belongs_to :album

end
