class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_secure_password
  validates :name,     presence: true, length: { in: 3..50 }
  validates :npwp,     presence: true, length: { is: 15 }
  validates :email,    presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, presence: true, allow_nil: true,  length: { in: 6..30 }

  secret_key = 'a21bfd88032f8ace32718efec68384e9'
  attr_encrypted :p12_passphrase, key: secret_key
end
