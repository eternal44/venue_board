# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  location    :string
#  start       :datetime
#  end         :datetime
#  employer_id :integer
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
  belongs_to :employer

  validates :title, presence: true
  validates :location, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :status, presence: true
  validates :employer_id, presence: true
end
