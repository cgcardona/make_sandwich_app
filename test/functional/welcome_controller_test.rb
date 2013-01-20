require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  setup do 
    @sandwichType = 'meat'
  end
  test "should post sandwichType" do
    post :post
    assert_not_nil @sandwichType
  end
end
