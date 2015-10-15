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
end
