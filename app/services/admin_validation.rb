class AdminValidation
  def initialize(current_user)
    @current_user = current_user
  end

  def perform
    if @current_user.is_admin
      return true
    else
      return nil
    end
  end
end