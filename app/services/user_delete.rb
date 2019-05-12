class UserDelete
  def initialize(event, attendance)
    @event = event
    @attendance = attendance
  end

  def perform
    destroy_attendance
    destroy_event
  end

  private

  def destroy_attendance
    @attendance.each do |a|
      a.destroy
    end
  end

  def destroy_event
    @event.each do |e|
      e.destroy
    end
  end
end