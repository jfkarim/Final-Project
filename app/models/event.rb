class Event < ActiveRecord::Base

  attr_accessible :admin_id, :description, :name, :date, :time, :address

  validates :admin_id, :name, :date, :time, :address, presence: true

  has_one :wall, as: :wallable

  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users, source: :user
  
  has_many :going_event_users, class_name: "EventUser", primary_key: :id, foreign_key: :event_id, conditions: "status = 'GOING'"
  has_many :going_users, through: :going_event_users, source: :user
  
  has_many :maybe_event_users, class_name: "EventUser", primary_key: :id, foreign_key: :event_id, conditions: "status = 'MAYBE'"
  has_many :maybe_users, through: :maybe_event_users, source: :user
  
  has_many :declined_event_users, class_name: "EventUser", primary_key: :id, foreign_key: :event_id, conditions: "status = 'DECLINED'"
  has_many :declined_users, through: :declined_event_users, source: :user
  
  has_many :pending_event_users, class_name: "EventUser", primary_key: :id, foreign_key: :event_id, conditions: "status = 'PENDING'"
  has_many :pending_users, through: :pending_event_users, source: :user
  
  def admin
    User.find(self.admin_id)
  end

end
