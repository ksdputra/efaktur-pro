require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(
      user_id: User.first.id,
      name: 'Macbook Pro',
      code: 'M01',
      price: 38_000_000
    )
  end

  test 'valid product' do
    assert @product.valid?
  end

  test 'invalid name' do
    @product.name = ''
    refute @product.valid?, 'product saved with blank String'

    @product.name = nil
    refute @product.valid?, 'product saved without name'
  end

  test 'invalid price' do
    @product.price = nil
    refute @product.valid?, 'product saved without price'
  end
end
