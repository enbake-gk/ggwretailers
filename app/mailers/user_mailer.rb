class UserMailer < ActionMailer::Base
  default from: "gwretailer@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Serial Number Tracking System')
  end  
end
