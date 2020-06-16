class Message
  def self.not_found(record = 'record')
    "Maaf, #{record} tidak ditemukan."
  end

  def self.invalid_credentials
    'Email atau Password salah.'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Sesi tidak ditemukan'
  end

  def self.unauthorized
    'Anda tidak diizinkan untuk melakukan aksi.'
  end

  def self.account_created
    'Akun berhasil dibuat'
  end

  def self.account_deleted
    'Akun tidak dapat ditemukan'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Maaf, sesi telah berakhir. Mohon login ulang untuk melanjutkan.'
  end
end
