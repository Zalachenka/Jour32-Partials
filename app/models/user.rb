class User < ApplicationRecord
  after_create :welcome_send

  has_many :attendances
  has_many :participant_events, through: :attendances, class_name: "Event"
  has_many :admin_events, foreign_key: "admin_id", class_name: "Event"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
