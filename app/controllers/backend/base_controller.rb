class Backend::BaseController < ApplicationController
  layout 'backend'
  $website=50
  def index

  end
  def pie
    official_num=Guest.where("approach=?","official").count
    refer_num=Guest.where("approach=?","reference").count
    relocation_num=Guest.where("approach=?","relocation").count
    hr_num=Guest.where("approach=?","hr").count
    ad_num=Guest.where("approach=?","advertise").count
    others_num=Guest.where("approach=?","others").count
    render :json=>{
      :official=>official_num,
      :referrence=>refer_num,
      :relocation=>relocation_num,
      :hr=>hr_num,
      :ad=>ad_num,
      :others=>others_num}
  end
end
