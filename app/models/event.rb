# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  title      :string
#  location   :string
#  start      :text
#  end        :text
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
