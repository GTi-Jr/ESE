# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..50).each do |i|
  test_user = User.new do |user|
    user.serial   = "#{Faker::Number.between(35,39)}#{Faker::Number.number(4)}"
    user.name     = Faker::Name.name
    user.email    = Faker::Internet.safe_email(user.name)
    user.age      = Faker::Number.between(17, 25)
    user.password = 'teste123'
    user.facebook = "fb.com/#{Faker::Bitcoin.address}"
    user.phone    = Faker::Number.number(9).to_s
  end

  test_user.save!
end

(1..5).each do |i|
  course = Course.new do |c|
    c.title               = "Curso de #{Faker::App.name}"
    c.description         = Faker::Lorem.paragraph
    c.day                 = Faker::Number.between(1, 30)
    c.time                = "#{Faker::Number.between(8, 20)}:00h"
    c.limit               = Faker::Number.between(5, 20)
    c.price               = Faker::Number.decimal(2).to_i
    c.image               = Faker::Placeholdit.image('300x300')
    c.teacher             = Faker::Name.name
    c.teacher_description = Faker::Lorem.paragraph
  end

  extra = Extra.new do |e|
    e.title       = "Conhecendo #{Faker::StarWars.character}"
    e.description = Faker::Lorem.paragraph
    e.limit       = Faker::Number.between(5, 20)
    e.price       = Faker::Number.decimal(2).to_i
    e.image       = Faker::Placeholdit.image('300x300')
  end

  lecture = Lecture.new do |l|
    l.title               = "Palestra sobre #{Faker::Superhero.power}"
    l.description         = Faker::Lorem.paragraph
    l.time                = "#{Faker::Number.between(8, 20)}:00h"
    l.day                 = Faker::Number.between(1, 30)
    l.image               = Faker::Placeholdit.image('300x300')
    l.price               = Faker::Number.decimal(2).to_i
    l.teacher             = Faker::Name.name
    l.teacher_description = Faker::Lorem.paragraph
  end

  tech = Tech.new do |t|
    t.title               = "Visitando #{Faker::StarWars.planet}"
    t.description         = Faker::Lorem.paragraph
    t.day                 = Faker::Number.between(1, 30)
    t.time                = "#{Faker::Number.between(8, 20)}:00h"
    t.limit               = Faker::Number.between(5, 20)
    t.price               = Faker::Number.decimal(2).to_i
    t.image               = Faker::Placeholdit.image('300x300')
    t.teacher             = Faker::Name.name
    t.teacher_description = Faker::Lorem.paragraph
  end

  course.save!
  lecture.save!
  tech.save!
  extra.save!
end

(1..3).each do |i|
  package = Package.new do |pc|
    pc.title    = "Pacote #{Faker::StarWars.character}"
    pc.price    = Faker::Number.decimal(2).to_i
    pc.courses  = Faker::Number.between(0, Course.all.count)
    pc.lectures = Faker::Number.between(0, Lecture.all.count)
    pc.teches   = Faker::Number.between(0, Tech.all.count)
    pc.extras   = Faker::Number.between(0, Extra.all.count)
  end

  package.save!
end
