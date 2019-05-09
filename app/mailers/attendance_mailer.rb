class AttendanceMailer < ApplicationMailer 
  default from: 'no-reply@eventbruh.fr'

  def confirmation_email(attendance, user)
    @attendance = attendance
    @user = user
    @url  = 'https://eventbruh.herokuapp.com/login' 

    mail(to: @user.email, subject: "Confirmation de l'evenement #{@attendance.event.title} !")
  end
end