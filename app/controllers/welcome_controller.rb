class WelcomeController < ApplicationController
  layout 'welcome'
  def index
    @houses=House.all
  end
end
