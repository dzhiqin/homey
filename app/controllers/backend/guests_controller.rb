class Backend::GuestsController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!
  def index
    @guests=Guest.all
  end
  def show
    @guest=Guest.find(params[:id])
  end
  def new
    @guest=Guest.new
    @guest.refer_guests.build
    @guest.refer_guests.build
  end
  def edit
    @guest=Guest.find(params[:id])
    @guest.refer_guests.build
    @guest.refer_guests.build
  end
  def create
    @guest=Guest.new(guest_params)
    if @guest.save
      redirect_to backend_guests_path
    else
      render :new
    end
  end
  def update
    @guest=Guest.find(params[:id])
    if @guest.update(guest_params)
      redirect_to backend_guests_path
    else
      render :edit
    end
  end
  def destroy
    @guest=Guest.find(params[:id])
    @guest.destroy
    flash[:alert]="已删除此条信息!"
    redirect_to backend_guests_path
  end
  private
  def guest_params
    params.require(:guest).permit(:name,:country_code,:status,:job,:email,:wechat,:phone,:company,:referrer,:approach,:house_district,:house_type,:liked_estate,:landscape,:house_floor,:house_parking,:house_furnished,:house_XIS,:check_in_date,:duration,:budget,:has_pet,:want_buy,:other_requests,:house_options=>[],:refer_guests_attributes=>[:id,:name,:contact,:_destroy])
  end
end
