class User < ActiveRecord::Base

  attr_accessible :email, :password, :artist_name, :profile_picture
  attr_reader :password

  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true
  validates :email, presence: true

  has_many :user_media
  has_many :media, through: :user_media, source: :medium
  has_many :user_influences
  has_many :influences, through: :user_influences, source: :influence
  has_many :user_themes
  has_many :themes, through: :user_themes, source: :theme
  has_many :user_locations
  has_many :locations, through: :user_locations, source: :location

  has_one :wall, as: :wallable, dependent: :destroy

  has_many :friendships, class_name: "Friendship", primary_key: :id, foreign_key: :in_friend_id
  has_many :approved_friendships, class_name: "Friendship", primary_key: :id, foreign_key: :in_friend_id, conditions: "status = 'APPROVED'"
  has_many :friends, through: :approved_friendships, source: :out_friend

  has_many :pending_friendships, class_name: "Friendship", primary_key: :id, foreign_key: :in_friend_id, conditions: "status = 'PENDING'"
  has_many :pending_friends, through: :pending_friendships, source: :out_friend

  has_many :group_users
  has_many :groups, through: :group_users, source: :group
  
  has_many :approved_group_users, class_name: "GroupUser", primary_key: :id, foreign_key: :user_id, conditions: "status = 'APPROVED'"
  has_many :approved_groups, through: :approved_group_users, source: :group
  
  has_many :pending_group_users, class_name: "GroupUser", primary_key: :id, foreign_key: :user_id, conditions: "status = 'PENDING'"
  has_many :pending_groups, through: :pending_group_users, source: :group

  has_many :event_users
  has_many :events, through: :event_users, source: :event
  
  has_many :going_event_users, class_name: "EventUser", primary_key: :id, foreign_key: :user_id, conditions: "status = 'GOING'"
  has_many :going_events, through: :going_event_users, source: :event
  
  has_many :pending_event_users, class_name: "EventUser", primary_key: :id, foreign_key: :user_id, conditions: "status = 'PENDING'"
  has_many :pending_events, through: :pending_event_users, source: :event

  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_initialize :ensure_session_token

  has_attached_file :profile_picture, styles: {
    standard: "200x200>",
    icon: "30x30>"
  }

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end

