class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: { in: 5..140 } 
  validates :description, presence: true, length: { in: 20..1000 } 
  validates :price, presence: true, length: { in: 1..1000 }
  validates :location, presence: true

  validate :event_must_be_after_time_now
  validate :multiple_of_5

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"

  has_one_attached :event_picture

  def event_must_be_after_time_now
    start_date > Time.now
  end

  def multiple_of_5
    duration%5 == 0
  end
end
