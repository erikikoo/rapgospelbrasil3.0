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
(1..100).each do |i|
  Word.create!(titulo: "Lipsum Post #{i}", artist_data_id: 2,texto: %{
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum. Vivamus viverra facilisis neque, in scelerisque urna pharetra vel. Donec a est mauris. Integer eget metus quis eros egestas elementum. Integer bibendum risus hendrerit dapibus tempor. Fusce placerat in orci vitae tincidunt.
  })
end    
