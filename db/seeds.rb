# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create([
  { number: 1, name: 'カテゴリー1', color: '#d8eecf' },
  { number: 2, name: 'カテゴリー2', color: '#d1e8f4' },
  { number: 3, name: 'カテゴリー3', color: '#fbf7dc' },
  { number: 4, name: 'カテゴリー4', color: '#efd6d6' }
])
