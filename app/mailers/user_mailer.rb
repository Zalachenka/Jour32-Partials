class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbruh.fr'
 
  def welcome_email(user)
    @user = user
    @url = 'https://eventbruh.herokuapp.com/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
