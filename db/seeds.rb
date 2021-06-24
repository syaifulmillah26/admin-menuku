# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

BusinessType.create([{ name: 'Cafe' }, { name: 'Restaurant' }])
Role.create([{ name: 'admin' }, { name: 'user' }])
User.create(email: 'admin@rubyh.co', role_ids: [1], password: '111111', password_confirmation: '111111')
