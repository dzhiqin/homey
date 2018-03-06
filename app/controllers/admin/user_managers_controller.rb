class Admin::UserManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @users=User.all
  end
  def art_designer
    @user=User.find(params[:id])
    if @user.has_role?(:art_designer)
      @user.remove_role :art_designer
    else
      @user.add_role :art_designer
    end
  end
  def employee
    @users=User.all
    @user=User.find(params[:id])
    if @user.has_role?(:employee)
      @user.remove_role :employee
      # 清空所有角色
      @user.roles=[]
    else
      @user.add_role :employee
    end
  end
  def housekeeper
    @user=User.find(params[:id])
    if @user.has_role?(:housekeeper)
      @user.remove_role :housekeeper
    else
      @user.add_role :housekeeper
    end
  end
  def cmanager
    @user=User.find(params[:id])
    if @user.has_role?(:cmanager)
      @user.remove_role :cmanager
    else
      @user.add_role :cmanager
    end
  end
  def overseer
    @user=User.find(params[:id])
    if @user.has_role?(:overseer)
      @user.remove_role :overseer
    else
      @user.add_role :overseer
    end
  end
  def salesman
    @user=User.find(params[:id])
    if @user.has_role?(:salesman)
      @user.remove_role :salesman
    else
      @user.add_role :salesman
    end
  end
  def salesman_p
    @user=User.find(params[:id])
    if @user.has_role?(:salesman_p)
      @user.remove_role :salesman_p
    else
      @user.add_role :salesman_p
    end
  end
  def imanager
    @user=User.find(params[:id])
    if @user.has_role?(:imanager)
      @user.remove_role :imanager
    else
      @user.add_role :imanager
    end
  end
  def imanager_p
    @user=User.find(params[:id])
    if @user.has_role?(:imanager_p)
      @user.remove_role :imanager_p
    else
      @user.add_role :imanager_p
    end
  end
  def acc
    @user=User.find(params[:id])
    if @user.has_role?(:acc)
      @user.remove_role :acc
    else
      @user.add_role :acc
    end
  end
  def hr
    @user=User.find(params[:id])
    if @user.has_role?(:hr)
      @user.remove_role :hr
    else
      @user.add_role :hr
    end
  end
  def design_director
    @user=User.find(params[:id])
    if @user.has_role?(:design_director)
      @user.remove_role :design_director
    else
      @user.add_role :design_director
    end
  end
  def design_assistant
    @user=User.find(params[:id])
    if @user.has_role?(:design_assistant)
      @user.remove_role :design_assistant
    else
      @user.add_role :design_assistant
    end
  end
  def rental_user
    @user=User.find(params[:id])
    if @user.has_role?(:rental_user)
      @user.remove_role :rental_user
    else
      @user.add_role :rental_user
    end
  end
  def asset_user
    @user=User.find(params[:id])
    if @user.has_role?(:asset_user)
      @user.remove_role :asset_user
    else
      @user.add_role :asset_user
    end
  end
  def admin
    @users=User.all
    @user=User.find(params[:id])
    if @user.has_role?(:admin)
      @user.remove_role :admin
    else

      @user.add_role :admin
    end
  end
end
