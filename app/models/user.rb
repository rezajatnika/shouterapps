class User < ActiveRecord::Base
  before_save :downcase_email

  # BCrypt
  has_secure_password

  # Validations
  validates :name,  presence: true, length: { maximum: 50 }

  validates :email, presence: true,
    length: { maximum: 250 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 },
    confirmation: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
