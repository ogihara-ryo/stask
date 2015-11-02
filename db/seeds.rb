# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
Category.create([
  { number: 1, name: 'カテゴリー1', color: '#d8eecf' },
  { number: 2, name: 'カテゴリー2', color: '#d1e8f4' },
  { number: 3, name: 'カテゴリー3', color: '#fbf7dc' },
  { number: 4, name: 'カテゴリー4', color: '#efd6d6' }
])

Task.delete_all
1.upto(4) do |i|
  # 昨日
  Task.create(id_per_days: i, target: Time.zone.yesterday, name: "タスク#{i}", priority: i,
              category: Category.find_by(number: i),
              estimate_hour: i + 0.5, started_at: (5 - i).hour.ago, finished_at: (4 - i).hour.ago)
  # 今日
  Task.create(id_per_days: i, target: Time.zone.today, name: "タスク#{i}", priority: i,
              category: Category.find_by(number: i),
              estimate_hour: i + 0.5, started_at: (5 - i).hour.ago)
  # 明日
  Task.create(id_per_days: i, target: Time.zone.tomorrow, name: "タスク#{i}", priority: i,
              category: Category.find_by(number: i),
              estimate_hour: i + 0.5, started_at: (5 - i).hour.ago)
end
