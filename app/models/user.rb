class User < ActiveRecord::Base
  before_save :downcase_email

    paginates_per 50

  # Virtual attributes
  attr_accessor :remember_token

  # BCrypt
  has_secure_password

  # Avatar images
  attachment :avatar_image, type: :image

  # Validations
  validates :name,  presence: true, length: { maximum: 50 }

  validates :email, presence: true,
    length: { maximum: 250 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 },
    confirmation: true,
    allow_blank: true

  # Returns random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remember token
  def remember
    self.remember_token = self.new_token
    update_attribute(:remember_digest, self.remember_token)
  end

  # Returns true if remember_token == remember_digest
  def authenticated?(remember_token)
    remember_token == self.remember_digest
  end

  # Forget user
  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  # Downcase email callback
  def downcase_email
    self.email = email.downcase
  end
end
