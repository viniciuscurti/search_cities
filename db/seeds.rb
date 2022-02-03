# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts 'Creating States'

State.create(name: 'Rio Grande do Sul')
State.create(name: 'Santa Catarina')
State.create(name: 'Parana')

puts 'Creating Cities'

City.create(name: 'Porto Alegre', state_id: State.find_by(name: 'Rio Grande do Sul').id)
City.create(name: 'Caxias', state_id: State.find_by(name: 'Rio Grande do Sul').id)
City.create(name: 'Gramado', state_id: State.find_by(name: 'Rio Grande do Sul').id)

City.create(name: 'Florianopolis', state_id: State.find_by(name: 'Santa Catarina').id)
City.create(name: 'Joinville', state_id: State.find_by(name: 'Santa Catarina').id)
City.create(name: 'Blumenau', state_id: State.find_by(name: 'Santa Catarina').id)

City.create(name: 'Curitiba', state_id: State.find_by(name: 'Parana').id)
City.create(name: 'Maringa', state_id: State.find_by(name: 'Santa Catarina').id)
City.create(name: 'Cascavel', state_id: State.find_by(name: 'Santa Catarina').id)

puts 'All cities and states created'
