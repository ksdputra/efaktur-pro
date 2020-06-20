require 'test_helper'

class NofaTest < ActiveSupport::TestCase
  def setup
    @nofa = Nofa.new(
      user_id: User.first.id,
      initial_number: '0012000000001',
      final_number: '0012000010000',
      published_date: '2020-06-01'
    )
  end

  test 'valid nofa' do
    assert @nofa.valid?
  end

  test 'invalid initial number' do
    @nofa.initial_number = nil
    refute @nofa.valid?, 'initial number cannot be nil'

    @nofa.initial_number = 'asdfghjkqwerty'
    refute @nofa.valid?, 'initial number has to be numeric'

    @nofa.initial_number = '1' * 14
    refute @nofa.valid?, 'initial number should only 13 characters'
  end

  test 'invalid final number' do
    @nofa.final_number = nil
    refute @nofa.valid?, 'final number cannot be nil'

    @nofa.final_number = 'asdfghjkqwerty'
    refute @nofa.valid?, 'final number has to be numeric'

    @nofa.final_number = '1' * 14
    refute @nofa.valid?, 'final number should only 13 characters'
  end

  test 'invalid range of nofa' do
    @nofa.initial_number = '0012000010000'
    @nofa.final_number = '0012000000001'
    refute @nofa.valid?, 'nofa initial number should smaller than final number'
  end
end
