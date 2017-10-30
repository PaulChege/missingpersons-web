class HomeController < ApplicationController
  def index
    @solved_cases = Case.where(status: 'solved').count
    @new_sightings = Sighting.all.count
    @new_cases = Case.all.count
    @new_users = User.all.count
  end
end
