class HomeController < ApplicationController
  def index
    @matches = Match.all.count
    @new_sightings = Sighting.all.count
    @new_cases = Case.all.count
    @new_users = PublicUser.all.count
  end
end
