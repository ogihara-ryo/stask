# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  target        :date             not null
#  name          :string           not null
#  priority      :integer
#  category_id   :integer
#  estimate_hour :float
#  started_at    :datetime
#  finished_at   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Task < ActiveRecord::Base
  belongs_to :category
end
