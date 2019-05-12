module ApplicationHelper
  def not_participant_nor_admin(event)
    current_user != event.admin && Attendance.where(event_id: event.id, participant_id: current_user.id).exists? == false
  end

  def is_validated(input)
    input.validated == true
  end

  def current_user_is_admin
    user_signed_in? && current_user.is_admin == true
  end

  def see_event_granted
    user_signed_in? && current_user.validated == true && @event.validated == true
  end

  def current_is_event_admin(event)
    current_user == event.admin
  end

  def event_picture_is_attached(event)
    event.event_picture.attached? == true
  end

  def avatar_is_attached(user)
     user.avatar.attached? == true
  end

  def participant(attendance)
    User.find(attendance.participant_id)
  end
end
