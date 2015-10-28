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

class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true
  validates :user_id, presence: true

end
