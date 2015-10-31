# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :tasks

  default_scope { order(:number) }

  validates :color, format: { with: /\A#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})\Z/ }
end
