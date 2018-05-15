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
        # User.find(guest.follows.last.user_id).email
        guest.follows.last.name
    end
  end
  def show_last_update_time(guest)
    if guest.follows.any?
      guest.follows.last.last_follow_date
    end

  end
  def show_name_memo(guest)
    if can? :update ,guest
      if guest.name_memo.present?
        "(#{guest.name_memo})"
      end
    end
  end
end
