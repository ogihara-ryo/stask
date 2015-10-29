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

FactoryGirl.define do
  factory :category do
    sequence(:number)
    sequence(:name) { |n| "Category#{n}" }
    color '#000000'
  end
end
