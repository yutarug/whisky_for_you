# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
# 	email: "yuta@yuta",
# 	password: "aaaaaa")

Bottle.create!(
	[
		{
		area_id: 1,
		bottle_name: 'GLENLIIVET',
		age: 12,
		image_id: File.open('./app/assets/images/glenlivet_12.jpg')
		},

		{
		area_id: 2,
		bottle_name: 'BenRiach',
		feature: "peated"
		# image_id: File.open('./app/assets/images/benriach_21_peated.jpeg')
        },
		
		{
		area_id: 3,
		bottle_name: 'BenRiach',
		feature: "cask_strength",
		image_id: File.open('./app/assets/images/benriach_caskstrength.jpg')
		},
		{
		area_id: 5,
		bottle_name: 'FourRoses',
		feature: ""
		}
	])


	