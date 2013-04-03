# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'populator'
require 'faker'

    
[Group, User, Membership, Role, UsersRole].each(&:delete_all)

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
		Membership.create(:user_id => user.id, :group_id => group.id)
		3.times do
			textpost = TextPost.create(:text => Populator.sentences(1..5))
			content = Content.create({
				:creator_id => user.id,
				:parent_group_id => group.id,
				:title => Populator.words(1..3).titleize,
				:media_id => textpost.id,
				:media_type => "TextPost",
				:is_private => [true, false].sample
				})
		end
	role = Role.create(:name => "admin", :resource_id => group.id, :resource_type => "Group")
	roleuser = [1, 2, 3, 4, 5].sample
	userrole = UsersRole.create(:role_id => role.id, :user_id => roleuser)
	group.update_attributes(:creator_id => roleuser)
	end
end
