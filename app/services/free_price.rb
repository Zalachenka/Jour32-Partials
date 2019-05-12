class FreePrice
  def initialize(event_id, participant_id, amount)
    @event_id = event_id
    @participant_id = participant_id
    @amount = amount
  end

  def perform
    is_event_free?
  end

  private
  
  def is_event_free?
    if @amount == 0
      @attendance = Attendance.create(stripe_customer_id: rand(1000..9999), participant_id: @participant_id, event_id: @event_id)
      flash[:success] = "You have been successfully registered!"
    end
  end
end