class Event < ActiveRecord::Base

  attr_accessible :admin_id, :description, :name, :date, :time, :address

  validates :admin_id, :name, :date, :time, :address, presence: true

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users, source: :user

  def admin
    User.find(self.admin_id)
  end

  def going_users
    self.event_users.where(status: "GOING").map { |gu| gu.user }
  end

  def maybe_users
    self.event_users.where(status: "MAYBE").map { |gu| gu.user }
  end

  def declined_users
    self.event_users.where(status: "DECLINE").map { |gu| gu.user }
  end

  def pending_users
    self.event_users.where(status: "PENDING").map { |gu| gu.user }
  end

end
