# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(email: 'jokerstudio26@gmail.com', password: 'j065807588', password_confirmation: 'j065807588', name: 'jokerstudio')
user.admin = true
user.confirmed_at = Time.now
user.save