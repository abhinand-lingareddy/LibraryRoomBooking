class UserMailer < ApplicationMailer
  default from: 'nabhi42@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'thank you for signingup')
  end
end
