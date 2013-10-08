class FriendRequest < ActiveRecord::Base
  STATUS_STATES = [
    "APPROVED",
    "DENIED",
    "PENDING"
  ]

  attr_accessible :requested_id, :requester_id, :status

  belongs_to :friend_requester, class_name: "User", primary_key: :user_id, foreign_key: :requester_id
  belongs_to :requested_friend, class_name: "User", primary_key: :user_id, foreign_key: :requested_id

  before_validation :assign_pending_status

  validates :requested_id, :requester_id, presence: true

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
