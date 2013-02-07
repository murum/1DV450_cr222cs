# -*- encoding : utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(first_name: "Christoffer", last_name: "Rydberg", email: "christoffer@rydberg.me", password: "TestPass")
u2 = User.create(first_name: "Sara", last_name: "Eriksson", email: "s.ericksson@hotmail.com", password: "TestPass")

pu = User.first()

p1 = Project.create(user_id: pu.id, name: "SandBoxedProject", description: "Jättebra test project", start_date: "2013-02-04", end_date: "2013-03-04")

u1.projects << p1
u2.projects << p1

