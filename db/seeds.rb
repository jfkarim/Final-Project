
User.create!({email: "jfk303@nyu.edu", password: "password", artist_name: "NoGod", profile_picture: File.new("app/assets/images/nogod.jpg")})
User.create({email: "email1", password: "password", artist_name: "oddity", profile_picture: File.new("app/assets/images/oddity.jpg")})
User.create({email: "email2", password: "password", artist_name: "Before Before", profile_picture: File.new("app/assets/images/beforebefore.jpg")})
User.create({email: "email3", password: "password", artist_name: "FLIP IN", profile_picture: File.new("app/assets/images/flipin.jpg")})
User.create({email: "email4", password: "password", artist_name: "White", profile_picture: File.new("app/assets/images/white.jpg")})
User.create({email: "email5", password: "password", artist_name: "Street Grief", profile_picture: File.new("app/assets/images/streetgrief.jpg")})
User.create({email: "email6", password: "password", artist_name: "OverHERE", profile_picture: File.new("app/assets/images/overhere.jpg")})
User.create({email: "email7", password: "password", artist_name: "Not There", profile_picture: File.new("app/assets/images/notthere.jpg")})
User.create({email: "email8", password: "password", artist_name: "The Mind's Pupil", profile_picture: File.new("app/assets/images/themindspupil.jpg")})

Wall.create({wallable_id: 1, wallable_type: "User"})
Wall.create({wallable_id: 2, wallable_type: "User"})
Wall.create({wallable_id: 3, wallable_type: "User"})
Wall.create({wallable_id: 4, wallable_type: "User"})
Wall.create({wallable_id: 5, wallable_type: "User"})
Wall.create({wallable_id: 6, wallable_type: "User"})
Wall.create({wallable_id: 7, wallable_type: "User"})
Wall.create({wallable_id: 8, wallable_type: "User"})
Wall.create({wallable_id: 9, wallable_type: "User"})

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

Friendship.create({in_friend_id: 1, out_friend_id: 2, status: "APPROVED"})
Friendship.create({in_friend_id: 2, out_friend_id: 1, status: "APPROVED"})
Friendship.create({in_friend_id: 1, out_friend_id: 3, status: "APPROVED"})
Friendship.create({in_friend_id: 3, out_friend_id: 1, status: "APPROVED"})
Friendship.create({in_friend_id: 1, out_friend_id: 4, status: "APPROVED"})
Friendship.create({in_friend_id: 4, out_friend_id: 1, status: "APPROVED"})
Friendship.create({in_friend_id: 1, out_friend_id: 5, status: "APPROVED"})
Friendship.create({in_friend_id: 5, out_friend_id: 1, status: "APPROVED"})
Friendship.create({in_friend_id: 1, out_friend_id: 6, status: "APPROVED"})
Friendship.create({in_friend_id: 6, out_friend_id: 1, status: "APPROVED"})
Friendship.create({in_friend_id: 1, out_friend_id: 7, status: "APPROVED"})
Friendship.create({in_friend_id: 7, out_friend_id: 1, status: "APPROVED"})
Friendship.create({in_friend_id: 1, out_friend_id: 8, status: "PENDING"})
Friendship.create({in_friend_id: 1, out_friend_id: 9, status: "PENDING"})

Friendship.create({in_friend_id: 2, out_friend_id: 3, status: "APPROVED"})
Friendship.create({in_friend_id: 3, out_friend_id: 2, status: "APPROVED"})
Friendship.create({in_friend_id: 2, out_friend_id: 4, status: "APPROVED"})
Friendship.create({in_friend_id: 4, out_friend_id: 2, status: "APPROVED"})
Friendship.create({in_friend_id: 2, out_friend_id: 5, status: "APPROVED"})
Friendship.create({in_friend_id: 5, out_friend_id: 2, status: "APPROVED"})
Friendship.create({in_friend_id: 2, out_friend_id: 8, status: "APPROVED"})
Friendship.create({in_friend_id: 8, out_friend_id: 2, status: "APPROVED"})
Friendship.create({in_friend_id: 5, out_friend_id: 6, status: "APPROVED"})
Friendship.create({in_friend_id: 6, out_friend_id: 5, status: "APPROVED"})
Friendship.create({in_friend_id: 6, out_friend_id: 7, status: "APPROVED"})
Friendship.create({in_friend_id: 7, out_friend_id: 6, status: "APPROVED"})
Friendship.create({in_friend_id: 8, out_friend_id: 9, status: "APPROVED"})
Friendship.create({in_friend_id: 9, out_friend_id: 8, status: "APPROVED"})

Friendship.create({in_friend_id: 4, out_friend_id: 7, status: "PENDING"})
Friendship.create({in_friend_id: 4, out_friend_id: 6, status: "PENDING"})
Friendship.create({in_friend_id: 4, out_friend_id: 9, status: "PENDING"})
Friendship.create({in_friend_id: 4, out_friend_id: 8, status: "PENDING"})


Group.create({admin_id: 1, name: "NYC Collective", description: "Artist collective based/working in NYC. We spread peace, love, anarchy, compassion, and the appreciation of using the streets as your personal canvas"})
Group.create({admin_id: 2, name: "The Life Group", description: "Group of artist friends just mucking around and about the world with some materials and the love of creating."})
Group.create({admin_id: 3, name: "How To", description: "We discuss how to do some stuff within the art community, whether technical or conceptual."})

Wall.create({wallable_id: 1, wallable_type: "Group"})
Wall.create({wallable_id: 2, wallable_type: "Group"})
Wall.create({wallable_id: 3, wallable_type: "Group"})

GroupUser.create({user_id: 1, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 2, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 3, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 4, group_id: 1, status: "APPROVED"})
GroupUser.create({user_id: 5, group_id: 1, status: "APPROVED"})

GroupUser.create({user_id: 1, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 2, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 3, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 4, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 5, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 6, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 7, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 8, group_id: 2, status: "APPROVED"})
GroupUser.create({user_id: 9, group_id: 2, status: "APPROVED"})

GroupUser.create({user_id: 1, group_id: 3, status: "PENDING"})
GroupUser.create({user_id: 2, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 3, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 4, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 5, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 6, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 7, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 8, group_id: 3, status: "APPROVED"})
GroupUser.create({user_id: 9, group_id: 3, status: "APPROVED"})

Event.create({admin_id: 1, name: "NYC Street Gallery", description: "Join the NYC Collective in presenting the best pieces of 2013 (At least the ones still standing)", address: "Brooklyn, NY", date: "2014-02-01", time: "2000-01-01 22:00:00"})
Event.create({admin_id: 2, name: "EuroGraf 2014", description: "The Largest European street artst gathering", address: "Paris, France", date: "2014-03-31", time: "2000-01-01 00:00:00"})
Event.create({admin_id: 3, name: "Africa Tags", description: "Have african roots or taste? Come help us put a live art exhibition to raise money for AIDS.", address: "Everywhere", date: "2014-06-13", time: "2000-01-01 12:00:00"})

Wall.create({wallable_id: 1, wallable_type: "Event"})
Wall.create({wallable_id: 2, wallable_type: "Event"})
Wall.create({wallable_id: 3, wallable_type: "Event"})

EventUser.create({user_id: 1, event_id: 1, status: "GOING"})
EventUser.create({user_id: 2, event_id: 1, status: "GOING"})
EventUser.create({user_id: 3, event_id: 1, status: "GOING"})
EventUser.create({user_id: 4, event_id: 1, status: "GOING"})
EventUser.create({user_id: 5, event_id: 1, status: "DECLINED"})
EventUser.create({user_id: 6, event_id: 1, status: "DECLINED"})

EventUser.create({user_id: 1, event_id: 2, status: "PENDING"})
EventUser.create({user_id: 2, event_id: 2, status: "GOING"})
EventUser.create({user_id: 3, event_id: 2, status: "GOING"})
EventUser.create({user_id: 4, event_id: 2, status: "GOING"})
EventUser.create({user_id: 5, event_id: 2, status: "GOING"})
EventUser.create({user_id: 6, event_id: 2, status: "MAYBE"})
EventUser.create({user_id: 7, event_id: 2, status: "DECLINED"})
EventUser.create({user_id: 8, event_id: 2, status: "DECLINED"})
EventUser.create({user_id: 9, event_id: 2, status: "DECLINED"})

EventUser.create({user_id: 1, event_id: 3, status: "GOING"})
EventUser.create({user_id: 2, event_id: 3, status: "GOING"})
EventUser.create({user_id: 3, event_id: 3, status: "DECLINED"})
EventUser.create({user_id: 4, event_id: 3, status: "DECLINED"})
EventUser.create({user_id: 5, event_id: 3, status: "GOING"})
EventUser.create({user_id: 6, event_id: 3, status: "MAYBE"})
EventUser.create({user_id: 7, event_id: 3, status: "GOING"})
EventUser.create({user_id: 8, event_id: 3, status: "GOING"})
EventUser.create({user_id: 9, event_id: 3, status: "GOING"})

Album.create({user_id: 1, title: "Canned.", description: "Walking around the world with a can"})
Album.create({user_id: 1, title: "MY C, NYC", description: "Walking around the world with a can"})
Album.create({user_id: 2, title: "YOLO = FROYO", description: "Walking around the world with a can"})
Album.create({user_id: 2, title: "Why Why Why", description: "Walking around the world with a can"})
Album.create({user_id: 3, title: "Period.", description: "Walking around the world with a can"})
Album.create({user_id: 3, title: "Tag, You're IT!", description: "Walking around the world with a can"})
Album.create({user_id: 4, title: "Worldy World", description: "Walking around the world with a can"})
Album.create({user_id: 4, title: "Citizen", description: "Walking around the world with a can"})
Album.create({user_id: 5, title: "Get Walled", description: "Walking around the world with a can"})
Album.create({user_id: 5, title: "Trace", description: "Walking around the world with a can"})


pic_num = 1

for i in 1..10
  
  user_id = 1 if i <= 2
  user_id = 2 if i > 2 && i <= 4
  user_id = 3 if i > 4 && i <= 6
  user_id = 4 if i > 6 && i <= 8
  user_id = 5 if i > 8 && i <= 10
  
  8.times do
    Photo.create({user_id: user_id, album_id: i, picture: File.new("public/seed_images/#{pic_num}.png")})
    pic_num += 1
  end
  
end


for i in 1..5
  4.times do
    Photo.create({user_id: i, picture: File.new("public/seed_images/#{pic_num}.png")})
    pic_num += 1
    break if pic_num > 100
  end
end