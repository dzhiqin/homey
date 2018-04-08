class HousesController < ApplicationController

  before_action :authenticate_user!
  before_action :employee_required
  load_and_authorize_resource
  def index
    @houses=House.order("status DESC").page(params[:page]).per(20)
    if params[:filter_house_id].present?
      @houses=House.where('house_id LIKE?',"%#{params[:filter_house_id]}%").order("status DESC").page(params[:page]).per(20)
    end
  end
  def show
    # @house=House.find(params[:id])
  end
  def new
    # @house=House.new
    @house.house_images.build
    if !@house.house_id.present?
      @house.house_id=generate_id.upcase
    end

  end
  def edit
    # @house=House.find(params[:id])
    @house.house_images.build if @house.house_images.empty?
  end
  def create
    @house=House.new(house_params)

    if @house.save
      redirect_to houses_path
    else
      render :new
    end
  end
  def update
    # @house=House.find(params[:id])
    if @house.update(house_params)
      redirect_to houses_path
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
  private
  def house_params
    params.require(:house).permit(:house_id,:last_login,:contact_phone,:district_id,:address,:gated_community,:landscape,:greening,:parking_space,:structure,:spatial_planning,:completion_date,:floor_height,:is_duplex,:property_area,:actual_area,:house_upgrade,:house_furnishings,:gas_pipeline,:elevator,:public_area,:wall_malleability,:house_malleability,:public_passage,:sercurity_service,:charter_costs,:monthly_rent,:payment_method,:price_before_operation,:transiportation_convinence,:shopping_convinence,:medical_convinence,:education_resources,:logo,:remove_logo,:contact_name,:cp_lat,:cp_lng,:status,:house_images_attributes=>[:id,:image,:description,:_destroy])

  end



end
