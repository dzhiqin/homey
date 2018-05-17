class SalariesController < ApplicationController
  before_action :authenticate_user!
  before_action :employee_required
  def index
    @user=current_user
    @salaries=current_user.salaries
  end
  def show
    @user=current_user
    @salary=Salary.find(params[:id])
  end
end
