require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @valid_event = events(:one)
    sign_in users(:two)
  end

  test 'should show event' do
    get :show, id: @valid_event
    assert_equal("MyString", @valid_event.title)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(@events)
  end

  # test 'should destroy job' do
  #   assert_difference 'Job.count', -1 do
  #     delete :destroy, id: @valid_event
  #   end
  # end

  # # test 'if signed in as artist should only show own jobs' do
  # #   sign_in employers(:one)
  # #   get :show, id: jobs(:two)
  # #   assert_response :redirect
  # # end

end

