class AdminMailer < ApplicationMailer
  def registration_email(attendance, admin, participant)
    @attendance = attendance
    @participant = participant
    @admin = admin
    @url  = 'https://eventbrite-steven.herokuapp.com/login' 

    mail(to: @admin.email, subject: "Confirmation de l'evenement #{@attendance.event.title} !")
  end
end
