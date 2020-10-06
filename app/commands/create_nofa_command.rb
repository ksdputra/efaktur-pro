class CreateNofaCommand
  def initialize(current_user, params)
    @nofa = current_user.nofas.new(params)
  end

  def save!
    @nofa.payload = fetch_payload if @nofa.valid?
    @nofa.save!
  end

  private

  def fetch_payload
    (@nofa.initial_number..@nofa.final_number).to_a
  end
end
