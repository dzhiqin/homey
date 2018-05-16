class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_and_profile
  def show

  end
  def edit

  end
  def update
    if @profile.update(profile_params)
      flash[:notice]="更新资料成功！"
      redirect_to edit_user_profile_path(@user)
    else
      render :edit
    end

  end
  private
  def find_user_and_profile
    @user=current_user
    @profile=@user.profile || @user.create_profile
  end
  def profile_params
    params.require(:profile).permit(:name,:birthday,:location,:occupation,:hiredate,:slogan,:job,:company,
      :phone,:email,:hometown,:education
    )
  end
end
