class Friendship < ActiveRecord::Base
  STATUS_STATES = [
    "APPROVED",
    "DENIED",
    "PENDING"
  ]

  attr_accessible :in_friend_id, :out_friend_id, :status
  #Will be saved twice, both users as each.
  belongs_to :in_friend, class_name: "User", primary_key: :user_id, foreign_key: :in_friend_id
  belongs_to :out_friend, class_name: "User", primary_key: :user_id, foreign_key: :out_friend_id

  before_validation :assign_pending_status

  validates :in_friend_id, :out_friend_id, :status, presence: true
  validates :in_friend_id, uniqueness: {scope: :out_friend_id}

  def approve!
    self.status = "APPROVED"
    self.save!
  end

  def approved?
    self.status == "APPROVED"
  end

  def denied?
    self.status == "DENIED"
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end

  private
  def assign_pending_status
    self.status ||= "PENDING"
  end
end
