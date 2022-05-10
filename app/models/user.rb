class User < ApplicationRecord
  after_initialize :ensure_session_token

  has_many :subs
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true

  validates :password_digest, presence: {message: ", Password cannot be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  def self.find_by_credentials(username,password)
    user = User.all.find_by_username(username)
    return user if user && user.is_password?(password)
    nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

end
