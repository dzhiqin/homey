class Backend::GuestsController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @guests=Guest.includes(:follows).includes(:options).order("status DESC").rank(:row_order).page(params[:page]).per(20)
  end
  def show
    pre_follow=@guest.follows.last
    follow=@guest.follows.build(:user_id=>current_user.id,:last_follow_date=>Time.now(),:name=>current_user.email)
    if  !validate_same_follow(pre_follow,follow)
      @guest.save
    else
      follow.destroy
    end
    @follows=@guest.follows.order("created_at DESC").page(params[:page]).per(20)
  end
  def new
    @guest.refer_guests.build
  end
  def edit
    @guest.refer_guests.build if @guest.refer_guests.empty?
    pre_follow=@guest.follows.last
    @pre_follow=@guest.follows.last
    follow=@guest.follows.build(:user_id=>current_user.id,:last_follow_date=>Time.now(),:name=>current_user.email)
    @guest.save if  !validate_same_follow(pre_follow,follow)
  end
  def create
    @guest=Guest.new(guest_params)
    @guest.creator=current_user.email.split("@")[0]
    @guest.row_order_position=:first
    if @guest.save
      follow=@guest.follows.last
      if follow.present?
        follow.last_follow_date=Time.now()
        follow.name=User.find(follow.user_id).email
        follow.save
      end
      redirect_to backend_guests_path
    else
      render :new
    end
  end
  def update
    @guest.row_order_position=:first
    pre_follow=@guest.follows.last
    if @guest.update(guest_params)
      follow=@guest.follows.last
      if !validate_same_follow(pre_follow,follow)
        follow.update(:name=>User.find(follow.user_id).email,:last_follow_date=>Time.now())
      end
      redirect_to backend_guests_path
    else
      render :edit
    end
  end
  def destroy
    @guest.destroy
    flash[:alert]="已删除此条信息!"
    redirect_to backend_guests_path
  end

  private
  def guest_params
    params.require(:guest).permit(:name,:country_code,:status,:job,:email,:wechat,:phone,:company,:referrer,:approach,:house_district,:house_type,:liked_estate,
      :landscape,:house_floor,:house_parking,:house_furnished,:house_XIS,:check_in_date,:duration,:budget,:has_pet,:want_buy,:other_requests,
      :follows_attributes=>[:id,:user_id,:guest_id,:name,:last_follow_date,:memo,:_destroy],:option_ids=>[],:refer_guests_attributes=>[:id,:name,:contact,:_destroy])
  end
  def validate_same_follow(pre_follow,follow)
    if pre_follow.present?
      pre_follow.user_id==follow.user_id && pre_follow.last_follow_date == follow.last_follow_date
    else
      false
    end
  end
end
