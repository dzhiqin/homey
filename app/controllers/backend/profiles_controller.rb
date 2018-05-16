class Backend::ProfilesController < ApplicationController
  layout 'backend'
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @profiles=Profile.eager_load(:user).where("is_employee=?",true).page(params[:page]).per(20)
  end
  def edit
    # @profile=Profile.find(params[:id])
    @user=@profile.user
  end
  def update
    # @profile=Profile.find(params[:id])
    @user=@profile.user
    if @profile.update(profile_params)
      flash[:notice]="更新成功！"
      redirect_to backend_profiles_path(@profile)
    else
      render :edit
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:name,:birthday,:location,:occupation,:hiredate,:slogan,:job,:company,
      :phone,:email,:hometown,:education
    )
  end
end
