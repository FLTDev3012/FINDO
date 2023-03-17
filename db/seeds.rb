require 'open-uri'


p "------ Starting creating data ----------"
# Wishlist.destroy_all
User.destroy_all
p "------ All users Destroyed ----------"
Wishlist.destroy_all
p "------ All wishlists Destroyed ----------"
Gift.destroy_all
p "------ All gifts Destroyed ----------"
WishlistsGift.destroy_all
p "------ All wishlistsGift Destroyed ----------"
Tag.destroy_all
p "------ All Tag Destroyed ----------"

dorian = User.create(email: "dorian@gmail.com", password: 'coucou', username: "Dorian l'éléphant", prenom: "Dorian", nom: "Fiolet")
jernito = User.create(email: "jernito@gmail.com", password: 'coucou', username: 'Jernito le rigolo', prenom: "Jernito", nom: "Le Goat")
eva = User.create(email: "eva@gmail.com", password: 'coucou', username: 'Eva la catha', prenom: "Eva", nom: "Queen")
mathieu = User.create(email: "mathieu@gmail.com", password: 'coucou', username: 'Mathieu le mieleux', prenom: "Mathieu", nom: "Accessory")

p "------ #{User.count} user created ----------"

file = URI.open("app/assets/images/avatar/Dorian.jpeg")
dorian.photo.attach(io: file, filename: "Dorian.jpeg", content_type: "image/jpeg")
dorian.save

file = URI.open("app/assets/images/avatar/Eva.jpeg")
eva.photo.attach(io: file, filename: "Eva.jpeg", content_type: "image/jpeg")
eva.save

file = URI.open("app/assets/images/avatar/Jernito.jpeg")
jernito.photo.attach(io: file, filename: "Jernito.jpeg", content_type: "image/jpeg")
jernito.save

file = URI.open("app/assets/images/avatar/Mathieu.jpeg")
mathieu.photo.attach(io: file, filename: "Mathieu.jpeg", content_type: "image/jpeg")
mathieu.save

p "------ 4 pictures avatar created ----------"


# seeds des cadeaux
Gift.destroy_all
p "------ All Gift Destroyed ----------"



# tag
# <%= image_tag "icones/vase.png" %>

anniv = Tag.create!(name: "Anniversaire")
noel = Tag.create!(name: "Noël")
naiss = Tag.create!(name: "Naissance")
petit = Tag.create!(name: "Petit cadeau")
adulte = Tag.create!(name: "Adulte")
bebe = Tag.create!(name: "Bébé")
ado = Tag.create!(name: "Ado")
enfant = Tag.create!(name: "Enfant")
deco = Tag.create!(name: "Décoration", image_path: "icones/vase.png")
sport = Tag.create!(name: "Sport", image_path: "icones/badminton.png")
made = Tag.create!(name: "Made in France", image_path: "icones/tour-eiffel.png")
life = Tag.create!(name: "Lifestyle", image_path: "icones/chien.png")
beau = Tag.create!(name: "Beauté", image_path: "icones/mascara.png")
zero = Tag.create!(name: "Zéro déchet", image_path: "icones/durabilite.png")
arti = Tag.create!(name: "Artisanal", image_path: "icones/echecs.png")
diy = Tag.create!(name: "DIY", image_path: "icones/couture.png")
ht = Tag.create!(name: "High-Tech", image_path: "icones/regarder.png")
six = Tag.create!(name: "0...500€")
un = Tag.create!(name: "0...25€")
deux = Tag.create!(name: "25...50€")
trois = Tag.create!(name: "50...100€")
quatre = Tag.create!(name: "100...200€")
cinq = Tag.create!(name: "200...500€")




p "------ Creating gift... ----------"
#1

gift_1 = Gift.create!(name: 'Bougies Carthage', price: 12, description: 'Nos bougies décoratives sont moulées individuellement en petite quantité dans notre studio à Paris. Nous utilisons la cire de soja 100% naturelle, végan et écoresponsable.', rating: 4.9, url: "https://www.etsy.com/listing/1395022433/the-carthage-pillars?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=bougies&ref=sr_gallery-1-7&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/40325058/r/il/a7fa98/4606306632/il_1588xN.4606306632_1t7x.jpg')
# file = URI.open("https://i.etsystatic.com/40325058/r/il/a7fa98/4606306632/il_1588xN.4606306632_1t7x.jpg")
# gift_1.gift_photo.attach(io: file, filename: "photo-bougie.jpg", content_type: "image/jpg")
# gift_1.save

bougie = Gift.create!(name: 'Bougies Carthage', price: 50, description: 'Nos bougies décoratives sont moulées individuellement en petite quantité dans notre studio à Paris. Nous utilisons la cire de soja 100% naturelle, végan et écoresponsable.', rating: 4.9, url: "https://www.etsy.com/listing/1395022433/the-carthage-pillars?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=bougies&ref=sr_gallery-1-7&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/40325058/r/il/a7fa98/4606306632/il_1588xN.4606306632_1t7x.jpg')
GiftsTag.create!(gift_id: bougie.id, tag_id: deco.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: petit.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: noel.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: made.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: life.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: arti.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: un.id)
GiftsTag.create!(gift_id: bougie.id, tag_id: six.id)



#2
montre = Gift.create!(name: 'Montre vintage', price: 100, description: "Montre entièrement restaurée par un horloger. Le bracelet en cuir a été fabriqué à la main par un artisan de l'ouest de l'Ukraine. Nous garantissons toutes les montres pendant 1 an.", rating: 4.7, url: "https://www.etsy.com/listing/746765659/very-rare-soviet-vintage-watch-watches?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=homme&ref=sc_gallery-1-1&pro=1&frs=1&sts=1&plkey=db52dad727ad6797817cb49fe1fd631a60573e3a%3A746765659", vote: 0, photo: 'https://i.etsystatic.com/15663507/r/il/ab8111/2054609580/il_1588xN.2054609580_svpa.jpg')
GiftsTag.create!(gift_id: montre.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: montre.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: montre.id, tag_id: ado.id)
GiftsTag.create!(gift_id: montre.id, tag_id: life.id)
GiftsTag.create!(gift_id: montre.id, tag_id: ht.id)
GiftsTag.create!(gift_id: montre.id, tag_id: quatre.id)
GiftsTag.create!(gift_id: montre.id, tag_id: six.id)

#3
cle = Gift.create!(name: 'Porte-clé', price: 55 , description: "Élégant porte-clés en cuir avec gravure. C'est un cadeau tout simplement sensationnel pour un être cher. Grâce à la belle rose des vents placée au centre du cercle en acier hautement poli, il devient un bijou de caractère.", rating: 4.1 , url: "https://www.etsy.com/listing/1381749398/unique-custom-coordinates-keychain?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sc_gallery-1-13&frs=1&sts=1&plkey=159c4c12e5429332ea72dc1f2a420c710ce9127d%3A1381749398", vote: 0, photo: 'https://i.etsystatic.com/38174537/r/il/a505ee/4531898162/il_1588xN.4531898162_nk5e.jpg')
GiftsTag.create!(gift_id: cle.id, tag_id: noel.id)
GiftsTag.create!(gift_id: cle.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: cle.id, tag_id: ado.id)
GiftsTag.create!(gift_id: cle.id, tag_id: deco.id)
GiftsTag.create!(gift_id: cle.id, tag_id: life.id)
GiftsTag.create!(gift_id: cle.id, tag_id: arti.id)
GiftsTag.create!(gift_id: cle.id, tag_id: deux.id)
GiftsTag.create!(gift_id: cle.id, tag_id: six.id)

#4
hat = Gift.create!(name: 'Hatdad', price: 59.20 , description: "Vous êtes à la recherche d'une casquette de baseball élégante, old school et vintage ? Alors vous allez adorer cette casquette en velours côtelé des années 90 avec sa broderie Fairywren unique ! Faites-vous remarquer et portez cette magnifique casquette à 6 panneaux au look rétro en toute occasion. Nos casquettes en velours côtelé 100 % coton, inspirées des années 90, sont de véritables must-haves et donneront immédiatement du piquant à votre style !", rating: 4.9 , url: "https://www.etsy.com/listing/1125334669/the-fairywren-corduroy-6-panel-hat-dad?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sc_gallery-1-5&frs=1&etp=1&sts=1&plkey=b397e24f6f0b6a5b60a706dc5496c9c7d28c902e%3A1125334669", vote: 0, photo: 'https://i.etsystatic.com/25974753/r/il/d75cf8/4655527520/il_1588xN.4655527520_d9gq.jpg')
GiftsTag.create!(gift_id: hat.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: hat.id, tag_id: noel.id)
GiftsTag.create!(gift_id: hat.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: hat.id, tag_id: ado.id)
GiftsTag.create!(gift_id: hat.id, tag_id: life.id)
GiftsTag.create!(gift_id: hat.id, tag_id: trois.id)
GiftsTag.create!(gift_id: hat.id, tag_id: six.id)

#5
fruit = Gift.create!(name:'Fruits du démon', price: 60, description: "Poster One Piece Anime - Akuma no mi. Le cadeau One Piece le plus cool pour tous les amateurs d'anime !", rating: 5, url: "https://www.etsy.com/listing/1419351371/one-piece-poster-devil-fruit-akuma-no-mi?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=one+piece&ref=sr_gallery-1-15&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/39097143/r/il/b83d1d/4681319376/il_1588xN.4681319376_kalw.jpg')
GiftsTag.create!(gift_id: fruit.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: noel.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: ado.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: enfant.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: deco.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: life.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: deux.id)
GiftsTag.create!(gift_id: fruit.id, tag_id: six.id)

#6
neon = Gift.create!(name: 'Néon', price: 78, description: "Obtenez votre enseigne néon personnalisée pour n'importe quelle occasion ! Les enseignes lumineuses que nous fabriquons peuvent être personnalisées comme vous le souhaitez, que ce soit pour un mariage, un bureau, un magasin, une maison ou une fête. Nous pouvons le faire.", rating: 5, url: "https://www.etsy.com/listing/965245133/custom-neon-sign-neon-sign-wedding-neon?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sc_gallery-1-8&pro=1&frs=1&sts=1&plkey=04091d0b2860592402861ee6aaac2452bb77a1ae%3A965245133", vote: 0, photo: 'https://i.etsystatic.com/27519419/r/il/1b2443/3522827430/il_1588xN.3522827430_lo4f.jpg')
GiftsTag.create!(gift_id: neon.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: neon.id, tag_id: noel.id)
GiftsTag.create!(gift_id: neon.id, tag_id: petit.id)
GiftsTag.create!(gift_id: neon.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: neon.id, tag_id: enfant.id)
GiftsTag.create!(gift_id: neon.id, tag_id: ado.id)
GiftsTag.create!(gift_id: neon.id, tag_id: bebe.id)
GiftsTag.create!(gift_id: neon.id, tag_id: deco.id)
GiftsTag.create!(gift_id: neon.id, tag_id: life.id)
GiftsTag.create!(gift_id: neon.id, tag_id: arti.id)
GiftsTag.create!(gift_id: neon.id, tag_id: ht.id)
GiftsTag.create!(gift_id: neon.id, tag_id: un.id)
GiftsTag.create!(gift_id: neon.id, tag_id: six.id)

#7
hochet = Gift.create!(name: 'Hochet bébé', price: 19.68 , description: "C'est un jouet amusant, parfait pour les petits qui aiment la musique ou faire du bruit ! Choisissez parmi 3 modèles différents, un éléphant, un ourson ou un lapin, chacun avec une poignée et des clochettes.", rating: 5 , url: "https://www.etsy.com/listing/1305314483/personalised-wooden-elephant-teddy-or?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sc_gallery-1-4&bes=1&plkey=d91966606d6898723eea9474563984f2add596f1%3A1305314483", vote: 0, photo: 'https://i.etsystatic.com/20752196/r/il/16ce14/4163686932/il_1588xN.4163686932_nip2.jpg')
GiftsTag.create!(gift_id: hochet.id, tag_id: naiss.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: noel.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: petit.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: bebe.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: arti.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: made.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: un.id)
GiftsTag.create!(gift_id: hochet.id, tag_id: six.id)

#8
kit = Gift.create!(name: 'Kit de broderie', price: 87, description: "Le kit comprend

- 1 cercle à broder
- 1 Tissu de lin illustré
- 1 jeu de fils de broderie en coton

Il y a 3 options pour l'aiguille à poinçonner,

1. Pas d'aiguille de perforation ( veuillez confirmer que vous avez l'aiguille de perforation )
2. Aiguille à poinçonner réglable en plastique
3. Aiguille à poinçonner en bois

Vous pouvez choisir en fonction de vos besoins :)", rating: 5 , url: "https://www.etsy.com/listing/1041587999/punch-needle-kit-for-beginner-beginner?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=diy&ref=sr_gallery-1-15&pro=1&frs=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/20217532/r/il/086e89/3214545023/il_1588xN.3214545023_fl5c.jpg')

GiftsTag.create!(gift_id: kit.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: kit.id, tag_id: noel.id)
GiftsTag.create!(gift_id: kit.id, tag_id: petit.id)
GiftsTag.create!(gift_id: kit.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: kit.id, tag_id: ado.id)
GiftsTag.create!(gift_id: kit.id, tag_id: deco.id)
GiftsTag.create!(gift_id: kit.id, tag_id: diy.id)
GiftsTag.create!(gift_id: kit.id, tag_id: un.id)
GiftsTag.create!(gift_id: kit.id, tag_id: six.id)

#9
affiche = Gift.create!(name: 'affiches pour nursery', price: 17.82 , description: "Set de 8 affiches pour chambre d'enfant", rating: 5 , url: "https://www.etsy.com/listing/1337396423/nursery-printable-art-set-diy-nursery?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=diy&ref=sc_gallery-1-5&pro=1&sts=1&plkey=53a0147de90194e2e4526f09401be99cd24b1f93%3A1337396423", vote: 0, photo: 'https://i.etsystatic.com/12078073/r/il/aa66df/4353677769/il_1588xN.4353677769_dpl3.jpg')
GiftsTag.create!(gift_id: affiche.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: noel.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: naiss.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: bebe.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: deco.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: arti.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: petit.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: un.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: six.id)

#10
trousse = Gift.create!(name: 'Trousse de toilettes', price: 66 , description: "Trousse de toilette en simili-cuir brodée d'initiales. Capacité de 3 litres.", rating: 5, url: "https://www.etsy.com/listing/1083997666/personalised-embroidered-mens-leather?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=homme&ref=sr_gallery-1-5&pop=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/27931246/r/il/a0932c/3380069678/il_1588xN.3380069678_dlot.jpg')
GiftsTag.create!(gift_id: trousse.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: ado.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: noel.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: life.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: arti.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: deux.id)
GiftsTag.create!(gift_id: trousse.id, tag_id: six.id)

#11
jeu = Gift.create!(name: 'Jeu en bois', price: 76, description: "Ce jeu de billes arc-en-ciel 4 couleurs est le cadeau idéal pour un bébé ou un enfant : à la fois éducatif et ludique, il apprend la représentation dans l'espace à l'enfant mais lui permet aussi d'être plus agile et alerte !

Ses couleurs pastel et son design en forme d'arc-en-ciel font de ce jouet pour enfant un excellent objet de décoration pour votre chambre d'enfant.", rating: 5, url: "https://www.etsy.com/listing/1224361768/custom-montessori-rainbow-toy-of-wooden?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=jeu&ref=sc_gallery-3-4&sts=1&plkey=105059765898a20687787a653bb812a1941fdf89%3A1224361768", vote: 0, photo: 'https://i.etsystatic.com/33092522/r/il/67fcb1/3940662397/il_1588xN.3940662397_sj85.jpg')
GiftsTag.create!(gift_id: jeu.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: noel.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: naiss.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: bebe.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: arti.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: petit.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: un.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: trois.id)
GiftsTag.create!(gift_id: jeu.id, tag_id: six.id)

#12
poster = Gift.create!(name: 'Poster Marrakech', price: 50, description: 'Souk des Tapis, Marrakech

Illustration minimaliste et colorée pour apporter un bout du Maroc dans votre intérieur.', rating: 5, url: "https://www.etsy.com/listing/1066740749/marrakech-morocco?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=lifestyle&ref=sc_gallery-1-2&frs=1&plkey=fc6a418e933fac91d89b52b06e1bf52870ff820b%3A1066740749", vote: 0, photo: 'https://i.etsystatic.com/23478732/r/il/969e52/3261025834/il_1588xN.3261025834_4jwk.jpg')
GiftsTag.create!(gift_id: poster.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: poster.id, tag_id: noel.id)
GiftsTag.create!(gift_id: poster.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: poster.id, tag_id: ado.id)
GiftsTag.create!(gift_id: poster.id, tag_id: enfant.id)
GiftsTag.create!(gift_id: poster.id, tag_id: deco.id)
GiftsTag.create!(gift_id: poster.id, tag_id: life.id)
GiftsTag.create!(gift_id: poster.id, tag_id: made.id)
GiftsTag.create!(gift_id: poster.id, tag_id: un.id)
GiftsTag.create!(gift_id: poster.id, tag_id: six.id)

#13
bracelet = Gift.create!(name: 'Bracelet liberty', price: 87, description: "Bracelet personnalisé en cordon Liberty avec médailles d'or à graver.", rating: 5, url: "https://www.etsy.com/listing/1245121736/personalized-bracelet-in-liberty-cord?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=bijoux&ref=sr_gallery-1-37&bes=1&sts=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/36391808/r/il/d0744b/4248340812/il_1588xN.4248340812_79nv.jpg')
GiftsTag.create!(gift_id: bracelet.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: noel.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: ado.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: petit.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: life.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: made.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: un.id)
GiftsTag.create!(gift_id: bracelet.id, tag_id: six.id)

#14
bague = Gift.create!(name: 'Bagues minimalistes', price: 76, description: "Bague SOLO avec chaîne boule plaquée or, remplie d'or, pierre fine, perle, bijoux fins", rating: 5, url: "https://www.etsy.com/listing/537650866/solo-ring-with-gold-plated-ball-chain?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sr_gallery-1-11&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/15505273/r/il/19a76e/4536588022/il_1588xN.4536588022_dmrk.jpg')
GiftsTag.create!(gift_id: bague.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: bague.id, tag_id: noel.id)
GiftsTag.create!(gift_id: bague.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: bague.id, tag_id: ado.id)
GiftsTag.create!(gift_id: bague.id, tag_id: petit.id)
GiftsTag.create!(gift_id: bague.id, tag_id: life.id)
GiftsTag.create!(gift_id: bague.id, tag_id: made.id)
GiftsTag.create!(gift_id: bague.id, tag_id: un.id)
GiftsTag.create!(gift_id: bague.id, tag_id: six.id)

#15
vase = Gift.create!(name: 'Vase', price: 98, description: "Vase à main humaine pour fleurs, plantes et fleurs séchées, vase en céramique, vase principal, vase à main, vase à fleurs en céramique, vase d'art unique", rating: 4.5, url: "https://www.etsy.com/listing/1076975823/human-hand-vase-for-flowers-plants-and?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=vase&ref=sr_gallery-1-7&pro=1&frs=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/23864248/r/il/671e22/3347076697/il_1588xN.3347076697_1nz2.jpg')
GiftsTag.create!(gift_id: vase.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: vase.id, tag_id: noel.id)
GiftsTag.create!(gift_id: vase.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: vase.id, tag_id: ado.id)
GiftsTag.create!(gift_id: vase.id, tag_id: deco.id)
GiftsTag.create!(gift_id: vase.id, tag_id: life.id)
GiftsTag.create!(gift_id: vase.id, tag_id: un.id)
GiftsTag.create!(gift_id: vase.id, tag_id: six.id)

#16
fleur = Gift.create!(name: 'Fleurs séchées', price: 90, description: "fleurs séchées déco
Bouquets de fleurs séchées
Rodanthe blanche
Pour une décoration bohème et naturelle, à détourner selon vos envies.", rating: 5, url: "https://www.etsy.com/listing/763302340/bouquet-dried-flowers?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=fleur+sech%C3%A9e&ref=sr_gallery-1-46&etp=1&sts=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/16246620/r/il/0e3d65/2182825558/il_1588xN.2182825558_lvww.jpg')
GiftsTag.create!(gift_id: fleur.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: noel.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: ado.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: deco.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: life.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: un.id)
GiftsTag.create!(gift_id: fleur.id, tag_id: six.id)

#17
terra = Gift.create!(name: 'Terrarium', price: 52.61, description: "Les terrariums suspendus en verre à bulles sont à la fois attrayants et écologiques. Leur fond est plat, ce qui permet de les suspendre ou de les poser sur une table. Remplissez ces pièces décoratives avec des plantes, des fleurs, des bougies ou d'autres objets pour une présentation étonnante qui impressionnera vos invités :) Ces objets sont livrés vides, prêts à être décorés !", rating: 4.5, url: "https://www.etsy.com/listing/864047849/3-6-round-bulb-terrarium-geometric-glass?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=terrarium+kit+for+adults&ref=sr_gallery-3-43&sts=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/9325814/r/il/4cb837/2549392811/il_1588xN.2549392811_abow.jpg')
GiftsTag.create!(gift_id: terra.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: terra.id, tag_id: noel.id)
GiftsTag.create!(gift_id: terra.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: terra.id, tag_id: ado.id)
GiftsTag.create!(gift_id: terra.id, tag_id: deco.id)
GiftsTag.create!(gift_id: terra.id, tag_id: life.id)
GiftsTag.create!(gift_id: terra.id, tag_id: diy.id)
GiftsTag.create!(gift_id: terra.id, tag_id: trois.id)
GiftsTag.create!(gift_id: terra.id, tag_id: six.id)

#18
matisse = Gift.create!(name: 'Affiches Matisse', price: 24.91, description: "Marché aux fleurs, Matisse Print, Yayoi Kusama, Green Gallery Wall, Fleurs de Jardin, Nude Body Line, Botanical Garden, Leaves, Tropical Set 3", rating: 5, url: "https://www.etsy.com/listing/1181374419/flower-market-matisse-print-yayoi-kusama?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=fleurs&ref=sc_gallery-1-4&pro=1&plkey=8c84fb65ff7181fc59a7dc822ca6f967e36b797f%3A1181374419", vote: 0, photo: 'https://i.etsystatic.com/23204678/r/il/56eaa3/3725532079/il_1588xN.3725532079_djsj.jpg')
GiftsTag.create!(gift_id: matisse.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: noel.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: ado.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: deco.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: life.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: un.id)
GiftsTag.create!(gift_id: matisse.id, tag_id: six.id)

#19
pochette = Gift.create!(name: 'Pochette tendance', price: 52, description: "Sac banane en velours de coton grosses côtes et doublure en Liberty ou coton imprimé de qualité, fermeture en métal doré écrue.

Sangle réglable en coton écru avec boucle coulissante.", rating: 5, url: "https://www.etsy.com/listing/1410442248/ribbed-velvet-belt-bag-khaki-beige-ocher?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=&ref=sr_gallery-1-7&sts=1&organic_search_click=1", vote: 0, photo: 'https://i.etsystatic.com/15569065/r/il/2ba911/4551930680/il_1588xN.4551930680_s58y.jpg')
GiftsTag.create!(gift_id: trousse.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: ado.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: noel.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: life.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: arti.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: trois.id)
GiftsTag.create!(gift_id: affiche.id, tag_id: six.id)

#20
bag = Gift.create!(name: 'Bumbag', price: 56.90, description: "Sac banane en cuir. Pochette banane porté bandoulière", rating: 4.5, url: "https://www.etsy.com/listing/1195987127/womens-leather-banana-bag-bum-bag-hip?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=sac+banane&ref=sc_gallery-1-6&frs=1&bes=1&plkey=3e31d3788b0d5a44238d5589e6721ff341178e98%3A1195987127", vote: 0, photo: 'https://i.etsystatic.com/23228114/r/il/d118c3/4204939046/il_1588xN.4204939046_cs01.jpg')
GiftsTag.create!(gift_id: bag.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: bag.id, tag_id: ado.id)
GiftsTag.create!(gift_id: bag.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: bag.id, tag_id: noel.id)
GiftsTag.create!(gift_id: bag.id, tag_id: life.id)
GiftsTag.create!(gift_id: bag.id, tag_id: arti.id)
GiftsTag.create!(gift_id: bag.id, tag_id: trois.id)
GiftsTag.create!(gift_id: bag.id, tag_id: six.id)

#21
fontaine = Gift.create!(name: 'Fontaine zen', price: 54.00, description: "La fontaine Terai illustre parfaitement cela avec un design très aérien et beaucoup de légèreté lui donnant une élégance rare.
  Sa forme arrondie, ses lignes douces, ses jarres suspendus et le son cristallin de l'eau lui permettent de créer une atmosphère propice à la détente et la relaxation.", rating: 5, url: "etsy.com/fr/listing/1293977738/fontaine-dinterieur-zen?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=home+decor&ref=sc_gallery-1-7&frs=1&plkey=42a315fd149f3b3f319e2b233b7b476e9777f883%3A1293977738", vote: 0, photo: 'https://i.etsystatic.com/27119866/r/il/2e7405/4764576845/il_1588xN.4764576845_abqr.jpg')
GiftsTag.create!(gift_id: fontaine.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: fontaine.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: fontaine.id, tag_id: noel.id)
GiftsTag.create!(gift_id: fontaine.id, tag_id: life.id)
GiftsTag.create!(gift_id: fontaine.id, tag_id: deco.id)
GiftsTag.create!(gift_id: fontaine.id, tag_id: trois.id)
GiftsTag.create!(gift_id: fontaine.id, tag_id: six.id)

#22
cadre = Gift.create!(name: 'Eucalyptus', price: 58.00, description: "Il s'agit d'un ensemble de 3 imprimés botaniques représentant un eucalyptus vert vif et une branche d'olivier. La couleur verte et vert sauge douce de ces plantes aquarelles apportera sûrement chaleur et harmonie dans votre espace. Cette belle combinaison de verdure à l'aquarelle est une décoration murale intemporelle et ajoutera de la légèreté à de nombreux intérieurs.", rating: 5, url: "https://www.etsy.com/fr/listing/638744835/minimalist-wall-decor-light-green?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=home+decor&ref=sc_gallery-1-2&pro=1&frs=1&sts=1&plkey=32897a68cd0eb578008b36a5b3aba8869e2ebf17%3A638744835", vote: 0, photo: 'https://i.etsystatic.com/18105190/r/il/3400c7/3977381628/il_1588xN.3977381628_qwln.jpg')
GiftsTag.create!(gift_id: cadre.id, tag_id: adulte.id)
GiftsTag.create!(gift_id: cadre.id, tag_id: anniv.id)
GiftsTag.create!(gift_id: cadre.id, tag_id: noel.id)
GiftsTag.create!(gift_id: cadre.id, tag_id: life.id)
GiftsTag.create!(gift_id: cadre.id, tag_id: deco.id)
GiftsTag.create!(gift_id: cadre.id, tag_id: trois.id)
GiftsTag.create!(gift_id: cadre.id, tag_id: six.id)

p "------ #{Gift.count} Gifts created ----------"


# gift tag

# GiftsTag.create!(gift_id:  tag_id:)
