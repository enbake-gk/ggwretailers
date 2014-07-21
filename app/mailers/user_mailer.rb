class UserMailer < ActionMailer::Base
  default from: "gwretailer@gmail.com"
  
  def welcome_email(user)
    @user = user
    if @user.is_retailer?
      @url  = 'http://gwretailers.herokuapp.com/'+"#{@user.contact_person.gsub(' ','')}"+'/sign_in'
    else
      @url  = 'http://gwretailers.herokuapp.com/users/sign_in'
    end
    mail(to: @user.email, subject: 'Welcome to GoRegister.co.nz, Your New Customer Warranty Tracking Tool')
  end

  def registrered_mail(equipment)
  	@equipment = equipment
  	mail(to: @equipment.email, subject: 'Your product registered successfully')
  end  
end
