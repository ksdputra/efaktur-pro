class User < ApplicationRecord
  has_many :companies
  has_many :products
  has_many :nofas

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_secure_password
  validates :npwp,     length: { is: 15 }
  validates :email,    uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, allow_nil: true,  length: { in: 6..30 }

  secret_key = 'a21bfd88032f8ace32718efec68384e9'
  attr_encrypted :passphrase, key: secret_key

  def show
    self.as_json(
      except: %i[
        password_digest
        digcert_data
        encrypted_passphrase
        encrypted_passphrase_iv
        created_at
        updated_at
        passphrase
      ]
    )
  end
end
