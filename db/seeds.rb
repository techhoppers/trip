# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({:email => "admin@tripnavigator.net", :password => "qwer1234", :password_confirmation => "qwer1234", :is_admin => true})
country = Country.create({:name => "India"})
state = country.states.create({:name => "Kerala"})
state.cities.create({:name => "Alappuzha"})
state.cities.create({:name => "Ernakulam"})
state.cities.create({:name => "Idukki"})
state.cities.create({:name => "Kannur"})
state.cities.create({:name => "Kasaragod"})
state.cities.create({:name => "Kollam"})
state.cities.create({:name => "Kottayam"})
state.cities.create({:name => "Kozhikode"})
state.cities.create({:name => "Malappuram"})
state.cities.create({:name => "Palakkad"})
state.cities.create({:name => "Pathanamthitta"})
state.cities.create({:name => "Thiruvananthapuram"})
state.cities.create({:name => "Thrissur"})
state.cities.create({:name => "Wayanad"})

Category.create({:name => "Beaches"})
Category.create({:name => "Backwaters"})
Category.create({:name => "Hill Stations"})
Category.create({:name => "Wildlife"})
Category.create({:name => "Festivals"})
Category.create({:name => "Ayurveda"})
Category.create({:name => "Culture"})
Category.create({:name => "Trekking"})
Category.create({:name => "Waterfalls"})
Category.create({:name => "Museum"})





