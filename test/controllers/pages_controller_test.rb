require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  # def setup
  #   base_title = 'Shouter'
  # end

  test 'hould get home' do
    get :home
    assert_response :success
    assert_select 'title', 'Home | Shouter'
  end

  test 'should get about' do
    get :about
    assert_response :success
    assert_select 'title', 'About | Shouter'
  end

  test 'should get help' do
    get :help
    assert_response :success
    assert_select 'title', 'Help | Shouter'
  end

    test 'should get contact' do
    get :contact
    assert_response :success
    assert_select 'title', 'Contact | Shouter'
  end
end
