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


chosenOne = User.create({
	:first_name => "Yoda",
	:last_name => "Baggins",
	:email => "djstevemcquaid@gmail.com",
	:password => "12345678",
	:password_confirmation => "12345678"
	})

chosenTwo = User.create({
	:first_name => "Sean",
	:last_name => "Hoffman",
	:email => "IsRaz88@gmail.com",
	:password => "testing1",
	:password_confirmation => "testing1"
	})


5.times do
	
	group = Group.create(:name => Populator.words(1..3).titleize)

	(5..10).each do
	
		user = User.create({
			:first_name => Faker::Name.first_name,
			:last_name => Faker::Name.last_name,
			:email => Faker::Internet.safe_email,
			:password => "password",
			:password_confirmation => "password"
			})
	
		membership = Membership.create(:user_id => user.id, :group_id => group.id)
		Activity.create(:action => 'create', :trackable => membership, :owner => user)
		
		5.times do

			type = ["UrlPost","TextPost","ImagePost", "VideoPost", "EventPost"].sample
			subtype = nil

			if type == "TextPost"
				
				textpost = TextPost.create({
					:text => Populator.paragraphs(1..3)
					})
				
				subtype = textpost
			
			elsif type == "ImagePost"
				
				imagepost = ImagePost.create({
					:image_url => Faker::Internet.url,
					:width => (360..1080),
					:height => (240..720)
					})

				subtype = imagepost

			elsif type == "VideoPost"

				videopost = VideoPost.create({
					:video_url => Faker::Internet.url,
					:length => (60..420),
					:width => (360..1080),
					:height => (240..720)
					})

				subtype = videopost

			elsif type == "EventPost"

				sdate = rand(2.months).ago
				w = rand(2..60)
				edate = sdate + w.days
				eventpost = EventPost.create({
					:location => Faker::Address.street_address,
					:start_date => sdate,
					:end_date => edate,
					:start_time => Time.now,
					:end_date => 2.hours.from_now,
					:is_all_day => [true, false].sample
					})
				subtype = eventpost

			elsif type == "UrlPost"

				urlpost = UrlPost.create({
					:url => Faker::Internet.url, 
					:domain_url => Faker::Internet.domain_name
					})
				subtype = urlpost

			end

			Activity.create(:action => 'create', :trackable => subtype, :owner => user)
			
			content = Content.create({
				:creator_id => user.id,
				:parent_group_id => group.id,
				:title => Populator.words(1..3).titleize,
				:mediable_id => subtype.id,
				:mediable_type => type,
				:is_private => [true, false].sample
				})

		end
	
	end

	role = Role.create(:name => "admin", :resource_id => group.id, :resource_type => "Group")
	roleuser = [1, 2, 3, 4, 5].sample
	userrole = UsersRole.create(:role_id => role.id, :user_id => roleuser)
	
	Activity.create(:action => 'create', :trackable => role, :owner_id => roleuser, :owner_type => "User")
	
	permission = Permission.create(:creator_id => roleuser, :role_id => role.id, :subject_type => "Group", :subject_id => group.id, :action => "manage")
	group.update_attributes(:creator_id => roleuser)
	
	Activity.create(:action => 'create', :trackable => group, :owner_id => roleuser, :owner_type => "User")

end
