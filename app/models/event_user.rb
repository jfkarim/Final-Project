class EventUser < ActiveRecord::Base
  STATUS_STATES = [
    "GOING",
    "MAYBE",
    "DECLINED",
    "PENDING"
  ]

  attr_accessible :user_id, :event_id, :status

  before_validation :assign_pending_status

  validates :user_id, :event_id, presence: true
  validates :event_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :event

  def going!
    self.status = "GOING"
    self.save!
  end

  def going?
    self.status == "GOING"
  end

  def declined?
    self.status == "DECLINED"
  end

  def decline!
    self.status = "DECLINED"
    self.save!
  end

  def maybe?
    self.status == "MAYBE"
  end

  def maybe!
    self.status = "MAYBE"
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
