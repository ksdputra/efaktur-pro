require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(
      user_id: User.first.id,
      npwp: '123456789012345',
      name: 'PT Berdikari',
      address: 'Taman Berdikari Sentosa',
      block: 'H',
      number: '3-5',
      rt: '001',
      rw: '001',
      village: 'Pejaten',
      subdistrict: 'Cikarang',
      regency: 'Jakarta Timur',
      province: 'DKI Jakarta',
      postal_code: '123456',
      phone: '021234567',
      is_dropdown: false
    )
  end

  test 'valid company' do
    assert @company.valid?
  end

  test 'invalid npwp' do
    @company.npwp = nil
    refute @company.valid?, 'company saved without npwp'

    @company.npwp = '12345'
    refute @company.valid?, 'company saved with npwp less than 15 characters'

    @company.npwp = '1234567890123456'
    refute @company.valid?, 'company saved with npwp more than 15 characters'
  end

  test 'invalid name' do
    @company.name = nil
    refute @company.valid?, 'company saved without name'

    @company.name = 'a' * 2
    refute @company.valid?, 'company saved with name less than 3 characters'

    @company.name = 'a' * 51
    refute @company.valid?, 'company saved with name more than 50 characters'
  end

  test 'invalid without address' do
    @company.address = nil
    refute @company.valid?
  end
end
