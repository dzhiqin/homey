class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path,:alert=>exception.message
  end
  def admin_required
    if !current_user.has_role?(:admin)
      redirect_to '/'
      flash[:alert]="您没有管理员权限!"
    end
  end
  def employee_required
    if !current_user.has_role?(:employee)
      redirect_to '/'
      flash[:alert]="需要员工身份才能查看页面！"
    end
  end
  def set_locale
    if params[:locale]&& I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale]=params[:locale]
    end
    I18n.locale=session[:locale]||I18n.default_locale
  end
end
