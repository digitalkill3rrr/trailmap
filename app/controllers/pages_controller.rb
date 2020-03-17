class PagesController < ApplicationController
  # load_and_authorize_resource
  def home
    @collections = Collection.all
    @routes = Route.all
    @spots = Spot.all
  end
end
