class PagesController < ApplicationController
  def home
    @collections = Collection.all
    @routes = Route.all
    @spots = Spot.all
  end
end
