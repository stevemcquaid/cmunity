# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'populator'
require 'faker'

    
[Group, User, Membership, Role, UsersRole, TextPost, ImagePost, UrlPost, Activity, Permission, EventPost, VideoPost].each(&:delete_all)


# Users
Veda = User.create({
	:first_name => "Veda",
	:last_name => "Vadyar",
	:email => "veda268@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Sean = User.create({
	:first_name => "Sean",
	:last_name => "Hoffman",
	:email => "IsRaz88@gmail.com@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Steve = User.create({
	:first_name => "Steve",
	:last_name => "McQuaid",
	:email => "djstevemcquaid@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Emily = User.create({
	:first_name => "Emily",
	:last_name => "Porter",
	:email => "emilyporter@andrew.cmu.edu",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Michelle = User.create({
	:first_name => "Michelle",
	:last_name => "Chyr",
	:email => "michellechyr@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Stephany = User.create({
	:first_name => "Stephany",
	:last_name => "Park",
	:email => "park.stephany@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Tom = User.create({
	:first_name => "Tom",
	:last_name => "Appleseed",
	:email => "tapple@andrew.cmu.edu",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Arjun = User.create({
	:first_name => "Arjun",
	:last_name => "Shah",
	:email => "arjun.shah@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Daniel = User.create({
	:first_name => "Daniel",
	:last_name => "Baker",
	:email => "dbaker@andrew.cmu.edu",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

Olivia = User.create({
	:first_name => "Olivia",
	:last_name => "Matheson",
	:email => "omathes@andrew.cmu.edu",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

# Groups
Bhangra = Group.create({
:name => "CMU Bhangra",
:description => "High energy South Asian folk dance team! Join us now and get the best workout of your life!"
})

OM = Group.create({
:name => "OM",
:description => "Organization for Indian spirituality and culture"
})

GlobalBusiness = Group.create({
:name => "Global Business Brigades Panama",
:description => "Alternate Spring Break organization bringing business consulting to rural areas of Panama!"
})

Theta = Group.create({
:name => "Kappa Alpha Theta",
:description => "Join Kappa Alpha Theta and embrace a wonderful sisterhood!"
})

ASA = Group.create({
:name => "Asian Students Association",
:description => "Bringing together a variety of East Asian cultures for events the whole campus can enjoy."
})

TOC = Group.create({
:name => "Technical Opportunities Conference",
:description => "A once a year career fair that brings some of the top tech firms right to your doorstep. TOC helps 
technical students at CMU maximize their career potential."
})

TheTartan = Group.create({
:name => "TheTartan",
:description => "The official school newspaper of CMU, bringing you news, campus events, and entertainment."
})

Senate = Group.create({
:name => "Student Senate",
:description => "Carnegie Mellon's official senatorial body. Got a suggestion? Come to one of our town hall meetings and share it!"
})

StuCo = Group.create({
:name => "Student College (StuCo)",
:description => "Mastered an art or skill? Want to share it with your campus community? Learn more about how you can teach
your own course through StuCo."
})

DS = Group.create({
:name => "Dancer's Symposium",
:description => "Our mission is to showcase the best dancers and dance troupes at CMU in our shows each semester."
})


# Memberships
Membership.create(:user_id => Veda.id, :group_id => Bhangra.id)
Membership.create(:user_id => Tom.id, :group_id => Bhangra.id)
Membership.create(:user_id => Steve.id, :group_id => Bhangra.id)
Membership.create(:user_id => Arjun.id, :group_id => Bhangra.id)
Membership.create(:user_id => Michelle.id, :group_id => Bhangra.id)


role = Role.create(:name => "admin", :resource_id => Bhangra.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Veda.id)

Membership.create(:user_id => Olivia.id, :group_id => GlobalBusiness.id)
Membership.create(:user_id => Tom.id, :group_id => GlobalBusiness.id)
Membership.create(:user_id => Daniel.id, :group_id => GlobalBusiness.id)

role = Role.create(:name => "admin", :resource_id => Bhangra.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Veda.id)

Membership.create(:user_id => Emily.id, :group_id => Theta.id)
Membership.create(:user_id => Olivia.id, :group_id => Theta.id)
Membership.create(:user_id => Stephany.id, :group_id => Theta.id)

role = Role.create(:name => "admin", :resource_id => Theta.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Emily.id)

Membership.create(:user_id => Veda.id, :group_id => TOC.id)
Membership.create(:user_id => Sean.id, :group_id => TOC.id)

role = Role.create(:name => "admin", :resource_id => TOC.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Veda.id)

Membership.create(:user_id => Steve.id, :group_id => OM.id)
Membership.create(:user_id => Sean.id, :group_id => OM.id)

role = Role.create(:name => "admin", :resource_id => OM.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Steve.id)

Membership.create(:user_id => Michelle.id, :group_id => ASA.id)
Membership.create(:user_id => Stephany.id, :group_id => ASA.id)

role = Role.create(:name => "admin", :resource_id => ASA.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Michelle.id)

Membership.create(:user_id => Arjun.id, :group_id => StuCo.id)

role = Role.create(:name => "admin", :resource_id => StuCo.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Arjun.id)

Membership.create(:user_id => Tom.id, :group_id => Senate.id)

role = Role.create(:name => "admin", :resource_id => Senate.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Tom.id)

Membership.create(:user_id => Daniel.id, :group_id => TheTartan.id)

role = Role.create(:name => "admin", :resource_id => TheTartan.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Daniel.id)

Membership.create(:user_id => Emily.id, :group_id => DS.id)

role = Role.create(:name => "admin", :resource_id => DS.id, :resource_type => "Group")
userrole = UsersRole.create(:role_id => role.id, :user_id => Emily.id)

#Activity.create(:action => 'create', :trackable => membership, :owner => user)


# Text Posts

textpost1 = TextPost.create({
					:content_attributes => {
						:creator_id => Steve.id,
						:parent_group_id => OM.id,
						:is_private => false,
						:title => "Need Utensils and Plates",
					},
					:text => "OM is hosting Holi and desperately needs utensils and plates for the event. 
					If any organization has extra, please let us know if you are willing to contribute! We'd greatly appreciate it!"
					})

textpost2 = TextPost.create({
					:content_attributes => {
						:creator_id => Olivia.id,
						:parent_group_id => Theta.id,
						:is_private => false,
						:title => "BBQ Shoutout",
					},
					:text => "Thank you for coming out to the Theta BBQ this weekend! We hope you had fun!"
					})

textpost3 = TextPost.create({
					:content_attributes => {	
						:creator_id => Tom.id,
						:parent_group_id => Senate.id,
						:is_private => true,
						:title => "Meeting Details",
					},
					:text => "The meeting location has been moved to the Alumni Lounge and the new time is at 7:00PM. Don't be late!"
					})

textpost4 = TextPost.create({
					:content_attributes => {
						:creator_id => Michelle.id,
						:parent_group_id => ASA.id,
						:is_private => false,
						:title => "Booth Pick Up Directions",
					},
					:text => "Meet at the cages today at 4PM. We are going to the store and picking up paint and wood for the booth.
					Mayur SASA is also tagging along so we can split costs for the zipcar and U-Haul!"
					})

textpost5 = TextPost.create({
					:content_attributes => {
						:creator_id => Arjun.id,
						:parent_group_id => Bhangra.id,
						:is_private => false,
						:title => "Healthy Eating Habits",
					},
					:text => "Eat only fruits and vegetables! Competition is next weekend! Just a few more days to go and then we'll let you eat cake :)"
					})

textpost6 = TextPost.create({
					:content_attributes => {
						:creator_id => Daniel.id,
						:parent_group_id => GlobalBusiness.id,
						:is_private => false,
						:title => "Krispy Kreme Donut Drop Off",
					},
					:text => "Be another Homer Simpson! Eat donuts and buy them for a good cause!"
					})

textpost7 = TextPost.create({
					:content_attributes => {
						:creator_id => Emily.id,
						:parent_group_id => DS.id,
						:is_private => false,
						:title => "Costumes Needed",
					},
					:text => "The DS semester show is coming up and we would love to use weird clothing that anyone would like to donate! It would be greatly appreciated!"
					})

textpost8 = TextPost.create({
					:content_attributes => {
						:creator_id => Daniel.id,
						:parent_group_id => TheTartan.id,
						:is_private => false,
						:title => "Photographers For This Weekend",
					},
					:text => "We need photographers to cover two events this weekend: Lunar Gala and the Mayur Show. Who's up for this?!"
					})




# Image Posts

imagepost = ImagePost.create({

					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

imagepost = ImagePost.create({
					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

imagepost = ImagePost.create({
					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

imagepost = ImagePost.create({
					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

imagepost = ImagePost.create({
					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

imagepost = ImagePost.create({
					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

# Event Posts

# Video Posts

# URL Posts


