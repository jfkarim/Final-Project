class Friendship < ActiveRecord::Base
  attr_accessible :in_friend_id, :out_friend_id
  #Will be saved twice, both users as each.
  belongs_to :in_friend, class_name: "User", primary_key: :user_id, foreign_key: :in_friend_id
  belongs_to :out_friend, class_name: "User", primary_key: :user_id, foreign_key: :out_friend_id

end
