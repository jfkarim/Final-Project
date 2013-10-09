class Post < ActiveRecord::Base
  attr_accessible :user_id, :wall_id, :content

  validates :user_id, :wall_id, :content, presence: true

  belongs_to :wall
  belongs_to :user #POSTER

end
