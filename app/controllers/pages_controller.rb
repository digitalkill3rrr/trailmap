class PagesController < ApplicationController
  def home
    @collections = Collection.all
    @routes = Route.all
    @spots = Spot.all
  end

  def constructor
    @route = current_user.routes.build
  end
end
