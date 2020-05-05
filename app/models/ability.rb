# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, :to => :crud

    # :create :read :update :destroy :index :manage

    if user.role == 'admin'
      can :manage, :all, :user_id => user.id
      can :read, :all
      can :destroy, Comment
      cannot [:create, :update, :destroy], [Route, Collection]

    elsif user.role == 'content'
      can :crud, [Collection, Route, Spot]
      can :manage, :all, :user_id => user.id
      cannot :index, [User, Comment]

    elsif user.role == 'user'
      can :manage, :all, :user_id => user.id
      can :read, :all
      cannot :index, User
      cannot :crud, [Route, Collection]
    else
      can :read, :all
    end
  end
end
