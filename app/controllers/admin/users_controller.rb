class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @users=User.recent.page(params[:page]).per(per_page)
    @custom_users=@users.where("is_employee=? and is_asset_user=?",false,false)
    @employee_users=@users.where("is_employee=?",true)
    @asset_users=@users.where("is_asset_user=?",true)
    if params[:from_date].present?
      @from_date=params[:from_date]
      @to_date=params[:to_date]
      @users=@users.where("created_at>=? and created_at <=?",Date.parse(params[:from_date]).beginning_of_day,Date.parse(params[:to_date]).end_of_day)
    end
    if params[:user_email].present?
      @user_email=params[:user_email]
      @users=@users.where('email LIKE ?',"%#{params[:user_email]}%")
    end

  end
  def bulk_update
    total=0
    Array(params[:custom_ids]).each do |custom_id|
      user=User.find(custom_id)
      if params[:commit]=="设为职员"
        user.add_role :employee
        user.is_employee=true
        total+=1
      elsif params[:commit] == "设为资管"
        user.add_role :asset_user
        user.is_asset_user=true
        total+=1
      end
      user.save
    end
    flash[:success]="成功编辑#{total}笔资料"
    redirect_to admin_users_path
  end
  def art_designer
    @user=User.find(params[:id])
    if @user.has_role?(:art_designer)
      @user.remove_role :art_designer
      @user.is_art=fals
    else
      @user.add_role :art_designer
      @user.is_art=true
    end
    @user.save
  end
  def employee
    @users=User.recent.page(params[:page]).per(per_page)
    @user=User.find(params[:id])
    if @user.has_role?(:employee)
      @user.remove_role :employee
      # 清空所有角色
      @user.roles=[]
      clear_flag
    else
      @user.add_role :employee
      @user.is_employee=true
    end
    @user.save
  end
  def housekeeper
    @user=User.find(params[:id])
    if @user.has_role?(:housekeeper)
      @user.remove_role :housekeeper
      @user.is_housekeeper=false
    else
      @user.add_role :housekeeper
      @user.is_housekeeper=true
    end
    @user.save
  end
  def cmanager
    @user=User.find(params[:id])
    if @user.has_role?(:cmanager)
      @user.remove_role :cmanager
      @user.is_cmanager=false
    else
      @user.add_role :cmanager
      @user.is_cmanager=true
    end
    @user.save
  end
  def overseer
    @user=User.find(params[:id])
    if @user.has_role?(:overseer)
      @user.remove_role :overseer
      @user.is_overseer=false
    else
      @user.add_role :overseer
      @user.is_overseer=true
    end
    @user.save
  end
  def salesman
    @user=User.find(params[:id])
    if @user.has_role?(:salesman)
      @user.remove_role :salesman
      @user.is_salesman=false
    else
      @user.add_role :salesman
      @user.is_salesman=true
    end
    @user.save
  end
  def salesman_p
    @user=User.find(params[:id])
    if @user.has_role?(:salesman_p)
      @user.remove_role :salesman_p
      @user.is_salesman_p=false
    else
      @user.add_role :salesman_p
      @user.is_salesman_p=true
    end
    @user.save
  end
  def imanager
    @user=User.find(params[:id])
    if @user.has_role?(:imanager)
      @user.remove_role :imanager
      @user.is_imanager=false
    else
      @user.add_role :imanager
      @user.is_imanager=true
    end
    @user.save
  end
  def imanager_p
    @user=User.find(params[:id])
    if @user.has_role?(:imanager_p)
      @user.remove_role :imanager_p
      @user.is_imanager_p=false
    else
      @user.add_role :imanager_p
      @user.is_imanager_p=true
    end
    @user.save
  end
  def acc
    @user=User.find(params[:id])
    if @user.has_role?(:acc)
      @user.remove_role :acc
      @user.is_acc=false
    else
      @user.add_role :acc
      @user.is_acc=true
    end
    @user.save
  end
  def hr
    @user=User.find(params[:id])
    if @user.has_role?(:hr)
      @user.remove_role :hr
      @user.is_hr=false
    else
      @user.add_role :hr
      @user.is_hr=true
    end
    @user.save
  end
  def design_director
    @user=User.find(params[:id])
    if @user.has_role?(:design_director)
      @user.remove_role :design_director
      @user.is_design_director=false
    else
      @user.add_role :design_director
      @user.is_design_director=true
    end
    @user.save
  end
  def design_assistant
    @user=User.find(params[:id])
    if @user.has_role?(:design_assistant)
      @user.remove_role :design_assistant
      @user.is_design_assitant=false
    else
      @user.add_role :design_assistant
      @user.is_design_assitant=true
    end
    @user.save
  end
  def rental_user
    @user=User.find(params[:id])
    if @user.has_role?(:rental_user)
      @user.remove_role :rental_user
      @user.is_rental_user=false
    else
      @user.add_role :rental_user
      @user.is_rental_user=true
    end
    @user.save
  end
  def asset_user
    @user=User.find(params[:id])
    if @user.has_role?(:asset_user)
      @user.remove_role :asset_user
      @user.is_asset_user=false
    else
      @user.add_role :asset_user
      @user.is_asset_user=true
    end
    @user.save
  end
  def admin

    @user=User.find(params[:id])
    if @user.has_role?(:admin)
      @user.remove_role :admin
      @user.is_admin=false
    else

      @user.add_role :admin
      @user.is_admin=true
    end
    @user.save
  end
  private
  def per_page
    20
  end
  def clear_flag
    @user.is_hr=false
    @user.is_art=false
    @user.is_acc=false
    @user.is_admin=false
    @user.is_salesman=false
    @user.is_salesman_p=false
    @user.is_deployee=false
    @user.is_cmanager=false
    @user.is_overseer=false
    @user.is_imanager=false
    @user.is_imanager_p=false
    @user.is_asset_user=false
    @user.is_rental_user=false
    @user.is_design_assitant=false
    @user.is_design_director=false
    @user.is_housekeeper=false
    @user.is_employee=false
  end
end
