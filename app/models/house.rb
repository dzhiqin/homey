class House < ApplicationRecord
  validates_presence_of :house_id,:contact_phone,:address,:spatial_planning,:house_upgrade,:gas_pipeline,:elevator,:sercurity_service,:charter_costs,:district_id,:floor_height,:gated_community
  validates_format_of :contact_phone,
    :with=> /1\d{10}/,
    :message=> '请输入正确的电话号码!'

  belongs_to :district
  STATUS=["valid","invalid"]
  validates_inclusion_of :status,:in=>STATUS
  mount_uploader :logo, LogoUploader
  has_many :house_images,:dependent=>:destroy
  accepts_nested_attributes_for :house_images,:allow_destroy=>true,:reject_if=>:all_blank
end
