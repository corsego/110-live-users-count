class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ landing_page dashboard ]

  def landing_page
  end

  def dashboard
    # list online users
    users_online = Kredis.unique_list "users_online"
    @users = User.find(users_online.elements)
  end
end
