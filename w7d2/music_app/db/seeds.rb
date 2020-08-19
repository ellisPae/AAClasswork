# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Band.destroy_all
Album.destroy_all


ellis = User.create!(email: 'ellis@appacademy.com', password: 'helloworld')
michio = User.create!(email: 'mkaku@nyu.edu', password: 'timeislikeariver')


lz = Band.create!(name: 'Led Zeppelin')
tupac = Band.create!(name: '2pac')


lz1 = Album.create!(
    title: 'Led Zeppelin',
    band_id: lz.id,
    year: 1969,
    live: false
    )

2pac1 = Album.create!(
    title: '2Pacalypse Now',
    band_id: tupac.id,
    year: 1991,
    live: false
)

