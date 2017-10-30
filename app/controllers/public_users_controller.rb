class PublicUsersController < ApplicationController

  def index
    @public_users = PublicUser.all
    @users = User.all
  end

end
