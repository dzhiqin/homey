class House < ApplicationRecord
  validates_presence_of :house_id,:contact_phone,:address,:spatial_planning,:house_upgrade,:gas_pipeline,:elevator,:sercurity_service,:charter_costs
  validates_format_of :contact_phone,
    :with=> /1\d{10}/,
    :message=> 'must be a phone number!'

  belongs_to :district
end
