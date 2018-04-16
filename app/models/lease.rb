class Lease < ApplicationRecord
  belongs_to :house,:optional=>true
end
