class User < ApplicationRecord
  has_many :attendances
  has_many :participant_events, through: :attendances, class_name: "Event"
  has_many :admin_events, foreign_key: "admin_id", class_name: "Event"
end
