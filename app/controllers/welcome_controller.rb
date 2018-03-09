class WelcomeController < ApplicationController
  def index
    @houses=House.limit(6)
  end
  def users_manager
    @users=User.all
  end


end
