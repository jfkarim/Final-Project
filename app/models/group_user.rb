class GroupUser < ActiveRecord::Base
  STATUS_STATES = [
    "APPROVED",
    "PENDING"
  ]

  attr_accessible :user_id, :group_id, :status

  before_validation :assign_pending_status

  validates :user_id, :group_id, presence: true
  validates :group_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :group

  def approve!
    self.status = "APPROVED"
    self.save!
  end

  def approved?
    self.status == "APPROVED"
  end

  def pending?
    self.status == "PENDING"
  end

  private
  def assign_pending_status
    self.status ||= "PENDING"
  end
end
