# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

root = Technology.create(name: "Tribes", depth: 0)
h = Technology.create(name: "Hunting", depth: 1)
a = Technology.create(name: "Agriculture", depth: 1)
i = Technology.create(name: "Irrigation", depth: 2)
f = Technology.create(name: "Fishing", depth: 2)
g = Technology.create(name: "Guilds", depth: 2)
t = Technology.create(name: "Trade", depth: 2)
s = Technology.create(name: "Stone quarries", depth: 3)
l = Technology.create(name: "Limestone quarries", depth: 3)

root.children << [h, a]
h.children << f
a.children << [i, g]
g.children << [s, l]

demo = User.create!(name: "Demo", email: "demo@demo.com", password: "demo", password_confirmation: "demo")
demo.token = User.generate_token
demo.assign_city

