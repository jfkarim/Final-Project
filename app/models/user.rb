class User < ActiveRecord::Base
  attr_accessible :email, :password, :artist_name
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

  has_many :friendships, class_name: "Friendship", primary_key: :id, foreign_key: :in_friend_id

  has_many :group_users
  has_many :groups, through: :group_users, source: :group

  has_many :event_users
  has_many :events, through: :event_users, source: :event

  after_initialize :ensure_session_token

  def pending_friends
    self.friendships.where(status: "PENDING").map { |fr| fr.out_friend }
  end

  def approved_friends
    self.friendships.where(status: "APPROVED").map { |fr| fr.out_friend }
  end

  def pending_groups
    self.group_users.where(status: "PENDING").map { |gu| gu.group }
  end

  def approved_groups
    self.group_users.where(status: "APPROVED").map { |gu| gu.group }
  end

  def pending_events
    self.event_users.where(status: "PENDING").map { |eu| eu.event }
  end

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

