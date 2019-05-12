class EventDelete
  def initialize(attendance)
    @attendance = attendance
  end

  def perform
    destroy_attendance
  end

  private

  def destroy_attendance
    @attendance.each do |a|
      a.destroy
    end
  end
end