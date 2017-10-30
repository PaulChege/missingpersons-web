# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = PublicUser.create(name:"John", email:"john@example.com",password: "123456",town: "Nairobi", status: "Active")
user.cases.create([{name: "JaneDoe",age:18,height: 1.7,weight: 60, body_type:"slim", location_last_seen:"Langata", date_last_seen:"10/10/2017",status: "solved",description: "...",date_reported:'10/10/2017',town:"Nairobi",reporter_rel: "Relative"}])
Sighting.create!([{public_user_id: 1,case_id:1,name: "JaneDoe",age:18,height: 1.7,weight: 60, body_type:"slim",description: "...",location: "Nairobi", date_reported:"10/10/2017"}])
Match.create!(case_id: 1,sighting_id: 1,image_match: 80, description_match: 80)
User.create(email: "pchegenjenga@gmail.com",password:"password")

