class Backend::SalariesController < ApplicationController
  layout 'backend'
  before_action :find_user
  def index
    @salaries=@user.salaries.page(params[:page]).per(20)
  end
  def new
    @salary=Salary.new
  end
  def show
    @salary=Salary.find(params[:id])
  end
  def create
    @salary=Salary.new(salary_params)
    @salary.user_id=@user.id

    if @salary.save
      redirect_to backend_user_salaries_path(@user)
    else
      render :new
    end
  end
  def edit
    @salary=Salary.find(params[:id])
  end
  def destroy
    @salary=Salary.find(params[:id])
    @salary.destroy
    flash[:alert]="成功删除"
    redirect_to backend_user_salaries_path(@user)
  end
  def update
    @salary=Salary.find(params[:id])
    if @salary.update(salary_params)
      flash[:notice]="创建成功！"
      redirect_to backend_user_salaries_path(@user)
    else
      render :edit
    end
  end
  private
  def find_user
    @user=User.find(params[:user_id])
  end
  def salary_params
    params.require(:salary).permit(:workdays,:attendance_days,:full_attendance_bonus,:leave_days,
      :holiday,:basic_wage,:post_wage,:subsidy,:salary,:endowment_insurance,:medical_insurance,
      :jobless_insurance,:housing_fund,:bonus,:tax,:salary_date,:name,:actual_salary,:performance_fee
    )
  end
end
