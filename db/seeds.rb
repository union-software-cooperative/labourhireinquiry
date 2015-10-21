# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

union = Union.create( name: "National Union of Workers", www: "https://www.nuw.org.au/", short_name: "NUW" )
user = Person.create( email: "admin@nuw.org.au", password: "temptemp", password_confirmation: "temptemp", first_name: "Admin", union: union )
