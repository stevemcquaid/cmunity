class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    can :read, :all

    if user.guest?
      can :show, Content, :is_private => false
      cannot :show, Content, :is_private => true
    end

    if !user.guest?
      can :show, Content, :is_private => false 
      cannot :show, Content, :is_private => true
      can :show, Content, :is_private => true, :creator_id => user.id
      can :show, Content, :is_private => true, :group => { :id => user.group_ids }
      can :new, Content
      can :manage, Group
    end



    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
