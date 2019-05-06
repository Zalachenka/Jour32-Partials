class AttendanceMailer < ApplicationMailer 
  def confirmation_email(attendance, user)
    @attendance = attendance
    @user = user
    @url  = 'https://eventbrite-steven.herokuapp.com/login' 

    mail(to: @user.email, subject: "Confirmation de l'evenement #{@attendance.event.title} !")
  end
end