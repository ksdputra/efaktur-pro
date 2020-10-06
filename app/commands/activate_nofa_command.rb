class ActivateNofaCommand
  def initialize(current_user, nofa_id)
    @current_user = current_user
    @nofa_id = nofa_id
  end

  def activate!
    nofa_to_be_activated = @current_user.nofas.find(@nofa_id)
    nofa_to_be_deactivated = @current_user.nofas.find_by(is_active: true)

    ActiveRecord::Base.transaction do
      activating(nofa_to_be_activated)
      deactivating(nofa_to_be_deactivated) if nofa_to_be_deactivated
    end
  end

  def activating(nofa)
    raise ExceptionHandler::CantDoAction, 'NSFP telah habis digunakan.' if nofa.is_expired

    nofa.is_active = true
    nofa.save!
  end

  def deactivating(nofa)
    nofa.is_active = false
    nofa.save!
  end
end
