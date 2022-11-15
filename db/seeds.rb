# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("Cadastrando moedas...")

Coin.create!(
    description: 'Bitcoin',
    acronym: 'BTC',
    url_image: 'https://cdn-icons-png.flaticon.com/512/6943/6943101.png'
)

Coin.create!(
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://cdn-icons-png.flaticon.com/512/6943/6943137.png'
)

Coin.create!(
    description: 'Dash',
    acronym: 'DASH',
    url_image: 'https://cdn-icons-png.flaticon.com/512/6943/6943131.png'
)

puts("Moedas cadastradas com sucesso!")