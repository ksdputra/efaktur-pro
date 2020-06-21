class CreateUserCommand
  def initialize(params)
    @user = User.new(params)
  end

  def save!
    @user.name = self.fetch_name
    @user.save!
    # TODO: Kirim p12 ke aplikasi agent
    # kemudian lakukan sign passphrase
    # kemudian restart aplikasi agent
  end

  private

  def fetch_name
    # TODO: untuk mendapatkan apa yang ada di p12
    # yaitu nama dan npwp
    return "PT #{RandomNameGenerator.new.compose(3)} #{RandomNameGenerator.new.compose(3)}"
  end
end
