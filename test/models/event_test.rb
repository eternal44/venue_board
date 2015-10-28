# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  location   :string
#  start_time :text
#  end_time   :text
#  user_id    :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @valid_event = events(:one)
  end

  test "should be valid" do
    assert @valid_event.valid?
  end

  test "employer id should be present" do
    @valid_event.user_id = nil
    assert_not @valid_event.valid?
  end

end
