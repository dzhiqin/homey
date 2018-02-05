class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin_required
    
  end
end
