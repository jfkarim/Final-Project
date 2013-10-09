class Wall < ActiveRecord::Base
  attr_accessible :wallable_id, :wallable_type

  belongs_to :wallable, polymorphic: true

  has_many :posts

end
