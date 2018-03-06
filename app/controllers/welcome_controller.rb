class WelcomeController < ApplicationController
  def index
    @houses=House.all
  end
  def users_manager
    @users=User.all
  end
  

end
