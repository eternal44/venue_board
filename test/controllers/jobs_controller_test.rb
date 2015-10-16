require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  test 'should show job' do
    get :show, id: @valid_job
    assert_equal("MyText", @valid_job.title)
  end

  test 'should get index' do
    get :index
    # assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test 'should destroy job' do
    assert_difference 'Job.count', -1 do
      delete :destroy, id: @valid_job
    end
  end
end
