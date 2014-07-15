class UserMailer < ActionMailer::Base
  default from: "gwretailer@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://gwretailers.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to GoRegister.co.nz, Your New Customer Warranty Tracking Tool')
  end

  def registrered_mail(equipment)
  	@equipment = equipment
  	mail(to: @equipment.email, subject: 'Your product registered successfully')
  end  
end
