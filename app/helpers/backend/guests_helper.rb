module Backend::GuestsHelper
  def salesman_users
    if Role.find_by_name(:salesman)
      Role.find_by_name(:salesman).users
      # 有全职业务员权限的user
    else
      User.all
    end
  end
  def show_follower(guest)
    if guest.follows.any?
        User.find(guest.follows.last.user_id).email
    end
  end
  def show_last_update_time(guest)
    if guest.follows.any?
      guest.follows.last.updated_at.strftime("%F %H:%M")
    end
  end
end
