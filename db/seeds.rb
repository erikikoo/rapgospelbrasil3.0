# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
   #Mayor.create(name: 'Emanuel', city: cities.first)
  # require "as-duration"
    
#Artist.create(email: 'seudesigner@outlook.com.br', password: 'filho@madozxc', password_confirmation: 'filho@madozxc', admin: true )
#Artist.create(email: 'erikikoo@hotmail.com', password: 'HayHelena', password_confirmation: 'HayHelena', admin: true )
#(5..41).each do |f|

(4..9).each do |f|
	numero = Random.rand(50..300)
	(1..numero).each do |i|  		
  		Like.create!(artist_data_id: f, ip: Faker::Internet.public_ip_v4_address, curtido: true, unlike: false)  		
  	end	
end  




