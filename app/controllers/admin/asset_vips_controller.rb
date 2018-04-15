class Admin::AssetVipsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def new
    @vip=AssetVip.new
  end
  def create
    @vip=AssetVip.new(vip_params)
    if @vip.save
      redirect_to admin_users_path
    else

    end
  end
  def update
    @vip=AssetVip.find(params[:id])
    if @vip.update(vip_params)
      redirect_to admin_users_path
    else
    end
  end
  def destroy
    @vip=AssetVip.find(params[:id])
    @vip.destroy
    redirect_to admin_users_path
  end
  private
  def vip_params
    params.permit(:name,:max_house)
  end
end
