class Backend::RentersController < ApplicationController
  before_action :authenticate_user!
  layout 'backend'
  def index
    @renters=Renter.page(params[:page]).per(20)
  end
  def show
    @renter=Renter.find(params[:id])
  end
  def new
    @renter=Renter.new
  end
  def edit
    @renter=Renter.find(params[:id])
  end
  def update
    @renter=Renter.find(params[:id])
    if @renter.update(renter_params)
      flash[:notice]="更新成功！"
      redirect_to backend_renters_path
    else
      flash[:alert]="更新失败！"
      render :edit
    end
  end
  def create
    @renter=Renter.new(renter_params)
    if @renter.save
      flash[:notice]="创建成功！"
      redirect_to backend_renters_path
    else
      flash[:alert]="创建失败！"
      render :new
    end
  end
  def destroy
    @renter = Renter.find(params[:id])
    @renter.destroy
    flash[:notice]="删除成功！"
    redirect_to backend_renters_path
  end
  private
  def renter_params
    params.require(:renter).permit(:rental_price,:address,:name,:budget,:budget_rental_ratio,:guest_id,
      :rental_from,:rental_to,:rental_duration,:rental_square
    )
  end
end
