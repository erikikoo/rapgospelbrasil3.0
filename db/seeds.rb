# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
   #Mayor.create(name: 'Emanuel', city: cities.first)
  # require "as-duration"
    for i in 1..20
  	Video.create(artist_id: 1, link: Faker::Internet.email)
    end
