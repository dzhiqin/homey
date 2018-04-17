class HousesController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :except=>[:vip_index]

  def index
    @houses=House.order("status DESC").order("updated_at DESC").page(params[:page]).per(20)
    if params[:filter_house_id].present?
      @houses=House.where('house_id LIKE?',"%#{params[:filter_house_id]}%").order("status DESC").order("updated_at DESC").page(params[:page]).per(20)
    end
  end
  def vip_index
    @houses=current_user.read_houses
  end
  def show
    # @house=House.find(params[:id])
    if params[:add]=="add_to_read"
      add_house_to_read

    end
  end
  def new
    # @house=House.new
    @house.house_images.build
    if !@house.house_id.present?
      @house.house_id=generate_id.upcase
    end

  end
  def add2

  end
  def edit
    # @house=House.find(params[:id])
    @house.leases.build(:house_id=>@house.id) unless @house.leases.present?
    @house.house_images.build if @house.house_images.empty?
  end
  def create
    @house=House.new(house_params)
    if @house.save
      redirect_to step2_house_path(@house)
    else
      render :new
    end
  end
  def update
    # @house=House.find(params[:id])
    if @house.update(house_params)
      redirect_to step2_house_path(@house)
    else
      render :edit
    end
  end
  def destroy
    # @house=House.find(params[:id])
    @house.destroy
    flash[:notice]="deleted!"
    redirect_to houses_path
  end
  def step1

  end
  def step1_update
    if @house.update(house_params)
      redirect_to step2_house_path(@house)
    else
      render :step1
    end
  end
  def step2
    @house.leases.build unless @house.leases.present?
    @house.save
  end
  def step2_update
    if @house.update(house_params)
      redirect_to houses_path
    else
      render :step2
    end
  end
  
  private
  def add_house_to_read
    if current_user.read_houses.size < current_user.asset_vip.max_house
      if current_user.read_houses.include?(@house)
        flash.now[:alert]="重复添加！"
      else
        current_user.read_houses << @house
        flash.now[:notice]="添加成功！"
      end
    else
      flash.now[:alert]="超出资管VIP等级最多可添加额度。"
    end
  end
  def house_params
    params.require(:house).permit(:house_id,:last_login,:contact_phone,:district_id,:address,:gated_community,:landscape,:greening,:parking_space,:structure,:spatial_planning,
      :completion_date,:floor_height,:is_duplex,:property_area,:actual_area,:house_upgrade,:house_furnishings,:gas_pipeline,:elevator,:public_area,:wall_malleability,:house_malleability,
      :public_passage,:sercurity_service,:charter_costs,:monthly_rent,:payment_method,:price_before_operation,:transportation_convenience,:shopping_convenience,:medical_convenience,:education_resources,
      :logo,:remove_logo,:contact_name,:cp_lat,:cp_lng,:status,
      :join_name,:bedroom,:bathroom,:veranda,:balcony,:refurbishment,:lease_plan,:indoor_theme,:guarantee_rate,:duration_of_renovation,:deposit,:daily_rent,
      :refurbishment_budget,:maintain_budget,:overdue_price,:referral_commission,:utilities,:VAT_merchant,:VAT_personal,:ROI_lease,:ROI_guarantee,:duration_of_lease,:duration_of_guarantee,
      :start_up_cost,:B_income_rate,:platform_income_rate,:house_images_attributes=>[:id,:image,:description,:_destroy],
      :leases_attributes=>[:id,:charter_costs,:platform_guarantee_yearly_income,:B_guarantee_yearly_income,:homey_guarantee_yearly_income_bonus,:_destroy]
    )

  end



end
