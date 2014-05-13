class Email < ActiveRecord::Base

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :frequency, presence: true, length: { minimum: 6 }
  validates :text , presence: true, length: { minimum: 6 }

end