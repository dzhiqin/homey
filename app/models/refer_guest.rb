class ReferGuest < ApplicationRecord
  belongs_to :guest,:optional=>true
end
