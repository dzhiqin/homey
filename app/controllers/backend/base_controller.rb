class Backend::BaseController < ApplicationController
  layout 'backend'
  $website=50
  def index

  end
  def pie
    website_num=Guest.where("approach=?","0").count
    refer_num=Guest.where("approach=?","1").count
    relocation_num=Guest.where("approach=?","2").count
    hr_num=Guest.where("approach=?","3").count
    ad_num=Guest.where("approach=?","4").count
    others_num=Guest.where("approach=?","5").count
    render :json=>{
      :website=>website_num,
      :referrence=>refer_num,
      :relocation=>relocation_num,
      :hr=>hr_num,
      :ad=>ad_num,
      :others=>others_num}
  end
end
