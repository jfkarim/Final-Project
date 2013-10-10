class Album < ActiveRecord::Base
  attr_accessible :title, :description, :user_id

  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

end
