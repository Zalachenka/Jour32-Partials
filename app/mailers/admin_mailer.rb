class AdminMailer < ApplicationMailer
  default from: 'no-reply@eventbruh.fr'

  def registration_email(attendance, admin, participant)
    @attendance = attendance
    @participant = participant
    @admin = admin
    @url  = 'https://eventbrite-steven.herokuapp.com/login' 

    mail(to: @admin.email, subject: "#{@participant} s'est inscrit à #{@attendance.event.title} !")
  end
end
