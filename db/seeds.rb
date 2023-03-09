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

wishlist_1 = Wishlist.create(name: 'Anniversaire Jernito', user_id: dorian.id)


# seeds des cadeaux
# create_table "gifts", force: :cascade do |t|
#   t.string "name"
#   t.float "price"
#   t.string "description"
#   t.float "rating"
#   t.string "url"
#   t.integer "vote"

Gift.destroy_all

#1
Gift.create!(name: 'Bougies Carthage', price: 12.00, description: 'Nos bougies décoratives sont moulées individuellement en petite quantité dans notre studio à Paris. Nous utilisons la cire de soja 100% naturelle, végan et écoresponsable.', rating: 4.9, url: "https://www.etsy.com/listing/1395022433/the-carthage-pillars?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=bougies&ref=sr_gallery-1-7&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/40325058/r/il/a7fa98/4606306632/il_1588xN.4606306632_1t7x.jpg')

#2
Gift.create!(name: 'Montre vintage', price: 125, description: 'Montre entièrement restaurée par un horloger. Le bracelet en cuir a été fabriqué à la main par un artisan de l'ouest de l'Ukraine. Nous garantissons toutes les montres pendant 1 an.', rating: 4.7, url: "https://www.etsy.com/listing/746765659/very-rare-soviet-vintage-watch-watches?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=homme&ref=sc_gallery-1-1&pro=1&frs=1&sts=1&plkey=db52dad727ad6797817cb49fe1fd631a60573e3a%3A746765659", vote: 0, photo: 'https://i.etsystatic.com/15663507/r/il/ab8111/2054609580/il_1588xN.2054609580_svpa.jpg')

#3
Gift.create!(name: 'Porte-clé', price: 35.00 , description: "Élégant porte-clés en cuir avec gravure. C'est un cadeau tout simplement sensationnel pour un être cher. Grâce à la belle rose des vents placée au centre du cercle en acier hautement poli, il devient un bijou de caractère.", rating: 4.1 , url: "https://www.etsy.com/listing/1381749398/unique-custom-coordinates-keychain?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sc_gallery-1-13&frs=1&sts=1&plkey=159c4c12e5429332ea72dc1f2a420c710ce9127d%3A1381749398", vote: 0, photo: 'https://i.etsystatic.com/38174537/r/il/a505ee/4531898162/il_1588xN.4531898162_nk5e.jpg')

#4
Gift.create!(name: 'Hatdad', price: 54.20 , description: "Vous êtes à la recherche d'une casquette de baseball élégante, old school et vintage ? Alors vous allez adorer cette casquette en velours côtelé des années 90 avec sa broderie Fairywren unique ! Faites-vous remarquer et portez cette magnifique casquette à 6 panneaux au look rétro en toute occasion. Nos casquettes en velours côtelé 100 % coton, inspirées des années 90, sont de véritables must-haves et donneront immédiatement du piquant à votre style !", rating: 4.9 , url: "https://www.etsy.com/listing/1125334669/the-fairywren-corduroy-6-panel-hat-dad?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sc_gallery-1-5&frs=1&etp=1&sts=1&plkey=b397e24f6f0b6a5b60a706dc5496c9c7d28c902e%3A1125334669", vote: 0, photo: 'https://i.etsystatic.com/25974753/r/il/d75cf8/4655527520/il_1588xN.4655527520_d9gq.jpg')

#5
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#6
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#7
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#8
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#9
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#10
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#11
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#12
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#13
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#14
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#15
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#16
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#17
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#18
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#19
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')

#20
Gift.create!(name: '', price: , description: '', rating: , url: "", vote: 0, photo: '')
