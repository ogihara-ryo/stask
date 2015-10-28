FactoryGirl.define do
  factory :category do
    sequence(:number)
    sequence(:name) { |n| "Category#{n}" }
    color '#000000'
  end
end
