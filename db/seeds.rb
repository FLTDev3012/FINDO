# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Wishlist.destroy_all
User.destroy_all
Wishlist.destroy_all
Gift.destroy_all
WishlistsGift.destroy_all
Tag.destroy_all


dorian = User.create(email: "dorian@gmail.com", password: 'coucou')
jernito = User.create(email: "jernito@gmail.com", password: 'coucou')

wishlist_1 = Wishlist.create(name: 'Wishlist 1', user_id: dorian.id)
wishlist_2 = Wishlist.create(name: 'Wishlist 2', user_id: dorian.id)
wishlist_3 = Wishlist.create(name: 'Wishlist 3', user_id: dorian.id)


gift_1 = Gift.create(name: 'Gift 1', price: 2)
gift_2 = Gift.create(name: 'Gift 2', price: 2)
gift_3 = Gift.create(name: 'Gift 3', price: 2)

WishlistsGift.create(wishlist: wishlist_1, gift: gift_1)
WishlistsGift.create(wishlist: wishlist_1, gift: gift_2)
WishlistsGift.create(wishlist: wishlist_2, gift: gift_3)

anniveraire = Tag.create(name: 'anniversaire')
noel = Tag.create(name: 'noel')
adulte = Tag.create(name: 'adulte')
decoration = Tag.create(name: 'decorations')
