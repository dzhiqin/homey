module Admin::UsersHelper
  def user_filters(options)
    params.merge(options)
  end
end
