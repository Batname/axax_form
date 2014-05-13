class Email < ActiveRecord::Base

  after_save :admin_confirmation_notification

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :frequency, presence: true, length: { minimum: 6 }
  validates :text , presence: true, length: { minimum: 6 }

  private

  def admin_confirmation_notification
  UserEmails.user_emails(self).deliver
  end

end