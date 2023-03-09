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
eva = User.create(email: "eva@gmail.com", password: 'coucou')
mathieu = User.create(email: "mathieu@gmail.com", password: 'coucou')

wishlist_1 = Wishlist.create(name: 'Wishlist 1', user_id: dorian.id)


# seeds des cadeaux
# create_table "gifts", force: :cascade do |t|
#   t.string "name"
#   t.float "price"
#   t.string "description"
#   t.float "rating"
#   t.string "url"
#   t.integer "vote"

Gift.create(name: 'Bouquet de fleurs', price: 25.99, description: 'Un joli bouquet de roses et de lys', rating: 3.4, url: "", vote: 0, photo: 'bouquet.jpg')
