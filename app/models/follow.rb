class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :guest,:optional=>true
end
