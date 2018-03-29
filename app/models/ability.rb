class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      # 管理员
      can :manage, :all
    elsif user.has_role?(:imanager)
      # 资管专员
      can :manage,House
      can :read ,Guest
    elsif user.has_role?(:imanager_p)
      # 兼职资管
      can :manage,House
      can :read,Guest
    elsif user.has_role?(:acc)
      # 会计
      can :read,House

    elsif user.has_role?(:salesman)
      # 业务员
      can :read ,Guest
    elsif user.has_role?(:salesman_p)
      # 兼职业务员
      can :read ,Guest
    elsif user.has_role?(:housekeeper)
      # 客房管家
      can :manage ,Guest

    elsif user.has_role?(:cm)
      # 施工经理
    elsif user.has_role?(:overseer)
      # 监工
    elsif user.has_role?(:hr)
      # 人事
      can :read,Guest
    elsif user.has_role?(:design_director)
      # 设计总监
    elsif user.has_role?(:design_assistant)
      # 设计助理
    elsif user.has_role?(:employee)
      # 职员
      can :read ,House
    elsif user.has_role?(:rental_user)
      # 租房用户
      can :read ,Guest
    elsif user.has_role?(:asset_user)
      # 资管用户
      can :read ,House
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
