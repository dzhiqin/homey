class House < ApplicationRecord
  validates_presence_of :house_id,:contact_phone,:address,:spatial_planning,:house_upgrade,:gas_pipeline,:elevator,:sercurity_service,:charter_costs

end
