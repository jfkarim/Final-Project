# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({email: "jfk303@nyu.edu", password: "password", artist_name: "IF/ELSE"})
User.create({email: "email1", password: "password", artist_name: "oddity"})
User.create({email: "email2", password: "password", artist_name: "Before Before"})
User.create({email: "email3", password: "password", artist_name: "FLIP IN"})
User.create({email: "email4", password: "password", artist_name: "White"})
User.create({email: "email5", password: "password", artist_name: "Street Grief"})
User.create({email: "email6", password: "password", artist_name: "OverHERE"})
User.create({email: "email7", password: "password", artist_name: "Not There"})
User.create({email: "email8", password: "password", artist_name: "The Mind's Pupil"})

Theme.create({name: "Politics"})
Theme.create({name: "War"})
Theme.create({name: "Revoulution"})
Theme.create({name: "Nature"})
Theme.create({name: "Poverty"})
Theme.create({name: "Love"})

Influence.create({name: "FUTURA"})
Influence.create({name: "Jean-Michel Basquiat"})
Influence.create({name: "Shepherd Fairey"})
Influence.create({name: "Banksy"})
Influence.create({name: "Todd James (REAS)"})
Influence.create({name: "Richard Hambleton"})

Medium.create({name: "Spray Paint"})
Medium.create({name: "Poster"})
Medium.create({name: "Marker"})
Medium.create({name: "Oil Paint"})
Medium.create({name: "Canvas"})

Location.create({city: "New York", country: "USA"})
Location.create({city: "Sao Paolo", country: "Brasil"})
Location.create({city: "Barcelona", country: "Spain"})
Location.create({city: "Paris", country: "France"})

UserTheme.create({user_id: 1, theme_id: 1})
UserTheme.create({user_id: 2, theme_id: 2})
UserTheme.create({user_id: 2, theme_id: 3})
UserTheme.create({user_id: 3, theme_id: 4})
UserTheme.create({user_id: 3, theme_id: 6})

UserInfluence.create({user_id: 1, influence_id: 1})
UserInfluence.create({user_id: 2, influence_id: 2})
UserInfluence.create({user_id: 3, influence_id: 4})
UserInfluence.create({user_id: 3, influence_id: 6})

UserMedium.create({user_id: 1, medium_id: 1})
UserMedium.create({user_id: 1, medium_id: 5})
UserMedium.create({user_id: 2, medium_id: 1})
UserMedium.create({user_id: 2, medium_id: 2})
UserMedium.create({user_id: 3, medium_id: 1})
UserMedium.create({user_id: 3, medium_id: 3})

UserLocation.create({user_id: 1, location_id: 1})
UserLocation.create({user_id: 1, location_id: 2})
UserLocation.create({user_id: 2, location_id: 2})
UserLocation.create({user_id: 2, location_id: 3})
UserLocation.create({user_id: 3, location_id: 1})
UserLocation.create({user_id: 3, location_id: 4})

Group.create({admin_id: 1, name: "Group 1", description: "HELLO"})

GroupUser.create({user_id: 1, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 2, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 3, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 4, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 5, group_id: 1, status: "APPROVED"})
