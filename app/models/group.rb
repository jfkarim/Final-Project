class Group < ActiveRecord::Base
  attr_accessible :admin_id, :description, :name

  validates :admin_id, :name, presence: true

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user

  def admin
    User.find(self.admin_id)
  end

  def approved_users
    self.group_users.where(status: "APPROVED").map { |gu| gu.user }
  end

  def pending_users
    self.group_users.where(status: "PENDING").map { |gu| gu.user }
  end
end
