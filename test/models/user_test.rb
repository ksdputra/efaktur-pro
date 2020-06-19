require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      npwp: '123456789012345',
      email: 'kputra@mailinator.com',
      password: '123456'
    )
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid npwp' do
    @user.npwp = nil
    refute @user.valid?, 'user saved without npwp'

    @user.npwp = '12345'
    refute @user.valid?, 'user saved with npwp less than 15 characters'

    @user.npwp = '1234567890123456'
    refute @user.valid?, 'user saved with npwp more than 15 characters'
  end

  test 'invalid email' do
    @user.email = nil
    refute @user.valid?, 'user saved without email'

    @user.email = 'kputramailinator.com'
    refute @user.valid?, 'user save without the right format'

    @user.email = 'kputra@mailinator'
    refute @user.valid?, 'user save without the right format'
  end

  test 'invalid password' do
    @user.password = nil
    refute @user.valid?, 'user saved without password'

    @user.name = 'a' * 5
    refute @user.valid?, 'user saved with name less than 6 characters'

    @user.name = 'a' * 31
    refute @user.valid?, 'user saved with name more than 30 characters'
  end
end
