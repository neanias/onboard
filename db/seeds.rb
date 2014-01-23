# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.create(title: 'Steer', address: 'EC1R 0JH', price: 1.00, max_guests: 4)

Room.create(title: 'King of Falafel',
            address: 'Leather Lane, London',
            price: 2.00,
            max_guests: 2)
