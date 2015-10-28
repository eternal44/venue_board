require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  def setup
    @profile = profiles(:one)
    sign_in users(:one)
  end

  test 'should show profile' do
    get :show, id: @profile
    assert_equal(@profile.name, "Mr. Admin")
  end

end
