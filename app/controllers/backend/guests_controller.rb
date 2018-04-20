class Backend::GuestsController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!
  load_and_authorize_resource
  def index

    @guests=Guest.includes(:follows).includes(:options).order("status DESC").rank(:row_order).page(params[:page]).per(20)

  end
  def show
    if @guest.follows.any? && @guest.follows.last.user_id==current_user.id
      pre_follow=@guest.follows.last
      @guest.follows.build(:user_id=>current_user.id,:last_follow_date=>Time.now(),:name=>current_user.email)
      @guest.save if pre_follow.last_follow_date!=@guest.follows.last.last_follow_date
    end
  end
  def new
    @guest.refer_guests.build
  end
  def edit
    @guest.refer_guests.build if @guest.refer_guests.empty?
    # @guest.follows.build(:user_id=>current_user.id) if @guest.follows.empty?
    @pre_follow=@guest.follows.last
    # @guest.follows.build
  end
  def create
    @guest=Guest.new(guest_params)
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
    # binding.pry
    if @guest.update(guest_params)
      @guest.row_order_position=:first
      @guest.save!
      @the_follow=@guest.follows.last
      t=@the_follow.updated_at
      @guest.follows.last.update(:last_follow_date=>t,:name=>User.find(@the_follow.user_id).email)
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
end
