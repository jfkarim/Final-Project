class Group < ActiveRecord::Base
  attr_accessible :admin_id, :description, :name

  validates :admin_id, :name, presence: true

  has_one :wall, as: :wallable

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  
  has_many :approved_group_users, class_name: "GroupUser", primary_key: :id, foreign_key: :group_id, conditions: "status = 'APPROVED'"
  has_many :approved_users, through: :approved_group_users, source: :user
  
  has_many :pending_group_users, class_name: "GroupUser", primary_key: :id, foreign_key: :group_id, conditions: "status = 'PENDING'"
  has_many :pending_users, through: :pending_group_users, source: :user

  def admin
    User.find(self.admin_id)
  end

end
