namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Group, User, Membership, Role, UsersRole].each(&:delete_all)

    Group.populate 20 do |group|
      group.name = Populator.words(1..3).titleize
      User.populate 5..10 do |user|
        user.first_name = Faker::Name.first_name
        user.last_name = Faker::Name.last_name
        user.email = Faker::Internet.safe_email
        user.password = "password"
        user.password_confirmation= "password"
        Membership.populate 1 do |membership|
          membership.user_id = user.id
          membership.group_id = group.id
        end
        Content.populate 4 do |content|
          content.creator_id = user.id
          content.parent_group_id = group.id
          content.title =  Populator.words(1..3).titleize
          TextPost.populate 1 do |textpost|
            textpost.text = Populator.sentences(1..5)
            content.media_id = textpost.id
            content.media_type = "TextPost"
            content.is_private = [true, false]
          end
        end
      end
      Role.populate 1 do |role|
        role.name = "admin"
        role.resource_id = group.id
        role.resource_type = "Group"
        UsersRole.populate 1 do |userrole|
          userrole.role_id = role.id
          userrole.user_id = [1, 2, 3]
        end
      end
    end
  end
end