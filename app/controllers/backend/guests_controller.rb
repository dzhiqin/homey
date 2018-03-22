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
  end
  def edit
    @guest=Guest.find(params[:id])
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
  end
  private
  def guest_params
    params.require(:guest).permit(:name,:nation,:job,:email,:wechat,:phone,:company,:referrer,:house_options,:house_district,:house_type,:liked_estate,:landscape,:house_floor,:house_parking,:house_furnished,:house_XIS,:check_in_time,:duration,:budget,:has_pet,:want_buy,:other_requests)
  end
end
