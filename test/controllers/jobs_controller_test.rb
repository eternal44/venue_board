require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  def setup
    @valid_job = jobs(:one)
    sign_in employers(:one)
  end

  test 'should show job' do
    get :show, id: @valid_job
    assert_equal("MyString", @valid_job.title)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(@jobs)
  end

  test 'should destroy job' do
    assert_difference 'Job.count', -1 do
      delete :destroy, id: @valid_job
    end
  end
end
