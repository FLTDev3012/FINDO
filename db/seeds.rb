# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Wishlist.destroy_all
User.destroy_all

dorian = User.create(email: "dorian@gmail.com", password: 'coucou')
jernito = User.create(email: "jernito@gmail.com", password: 'coucou')

wishlist_1 = Wishlist.create(name: 'Wishlist 1', user_id: dorian.id)
