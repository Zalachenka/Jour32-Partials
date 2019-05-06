class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-steven.fr'
 
  def welcome_email(user)
    @user = user
    @url = 'https://eventbrite-steven.herokuapp.com/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  # def confirmation_email(user)
  #   @user = user 
  #   @url  = 'https://eventbrite-steven.herokuapp.com/login' 

  #   mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  # end
end
