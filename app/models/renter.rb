class Renter < ApplicationRecord
  belongs_to :guest ,:optional=>true
end
