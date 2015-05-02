require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Reza Jatnika', email: 'reza@rakarsa.io',
      password: 'secretpassword', password_confirmation: 'secretpassword')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'user name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'user email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'user name should not be too long' do
    @user.name = 'r' * 51
    assert_not @user.valid?
  end

  test 'user email should not be too long' do
    @user.email = 'r' * 256
    assert_not @user.valid?
  end

  test 'user email should be a valid address' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'user email should not an invalid address' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should invalid"
    end
  end

  test 'user email should be unique' do
    duplicate = @user.dup
    @user.save
    assert_not duplicate.valid?
  end

  test 'user password has minimum length' do
    @user.password = 'r' * 5
    assert_not @user.valid?
  end
end
