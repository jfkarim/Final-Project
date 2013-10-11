class Photo < ActiveRecord::Base
  attr_accessible :picture, :location, :description, :album_id, :user_id

  validates :picture, :user_id, presence: true

  belongs_to :album
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_attached_file :picture, styles: {
    standard: "200x200>",
    icon: "75x75>"
  }

end
