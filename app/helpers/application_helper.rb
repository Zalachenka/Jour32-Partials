module ApplicationHelper
  def not_participant_nor_admin(event)
    current_user != event.admin && Attendance.where(event_id: event.id, participant_id: current_user.id).exists? == false
  end
end
