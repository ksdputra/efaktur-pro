class Nofa < ApplicationRecord
  belongs_to :user

  NOFA_REGEX = /\A\d+\z/.freeze
  validates :initial_number, presence: true, length: { is: 13 }, format: { with: NOFA_REGEX }
  validates :final_number,   presence: true, length: { is: 13 }, format: { with: NOFA_REGEX }
  validate  :bigger_than

  def bigger_than
    if initial_number >= final_number
      errors.add(:base, 'Nomor faktur awal harus lebih kecil daripada nomor faktur akhir')
    end
  end
end
