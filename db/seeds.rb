# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do 

	Project.create([
			{ title: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...'},
			{ short_description: '' },
			{ description: '' },
			{ pitch: '' },
			{ user_id: '' },
			{ created_at: '' },
			{ updated_at: '' },
			])

end