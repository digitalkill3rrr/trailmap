# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
      cannot [:update, :destroy], Comment
    elsif user.role == 'content'
      can :manage, :all
      cannot :index, User
      cannot [:update, :destroy], Comment
    elsif user.role == 'user'
      can :manage, :all
      can :update, :spots, :status
      cannot [:create, :update, :destroy], Collection
      cannot :index, [User, Comment]
    else
      can :read, :all
      cannot :index, [User, Comment]
    end

    # if user.role == 'admin'
    #   can [:read, :destroy], :all
    # elsif user.role == 'content'
    #   can :manage, :all, id: user.id
    #   cannot :index, [User, Comment]
    # elsif user.role == 'user'
    #   can :manage, [Spot, Comment], :user_id => user.id
    #   can :read, :all
    #   cannot [:create, :update, :destroy], [Route, Collection]
    #   cannot :index, [User, Comment]
    # else
    #   can :read, :all
    #   cannot :index, [User, Comment]
    # end



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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
