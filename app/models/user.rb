class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
  before_create :create_remember_token

  before_save do
    self.email.downcase!
  end
  
  def to_s
    name
  end

  def User.new_secure_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # Set the user signed in and return the remember token for the cookie
  def try_sign_in(password)
    if authenticate(password)
      remember_token = User.new_secure_token
      self.remember_token = User.digest(remember_token)
    else
      remember_token = nil
    end
    save
    remember_token
  end

  def sign_out
    update_attribute(:remember_token, User.digest(User.new_secure_token))
  end

  def confirm(token)
    if User.digest(token) == confirmation_digest
      update_attribute(:confirmed, true)
    end
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_secure_token)
    end
end
