class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  after_create :welcome_send

  has_many :attendances
  has_many :participant_events, through: :attendances, class_name: "Event"
  has_many :admin_events, foreign_key: "admin_id", class_name: "Event"

  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
