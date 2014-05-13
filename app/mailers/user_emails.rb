class UserEmails < ActionMailer::Base
  default :from => "dadubinin@gmail.com"

  def user_emails(email)
    @email = email
    mail(to: "dadubinin@gmail.com")
  end

end
