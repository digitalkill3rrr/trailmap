# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.role == 'admin'
      can :manage, :all, :user_id => user.id
      can :read, :all
      can :map_data, Route
      can :destroy, Comment
      cannot [:create, :update, :destroy], [Route, Collection]

    elsif user.role == 'content'
      can :crud, [Collection, Route, Spot]
      can :manage, :all, :user_id => user.id
      can :map_data, Route
      cannot :index, [User, Comment]

    elsif user.role == 'user'
      can :manage, :all, :user_id => user.id
      can :read, :all
      can :map_data, Route
      cannot :index, User
      cannot [:create, :update, :delete], [Route, Collection]
    else
      can :read, :all
    end
  end
end
