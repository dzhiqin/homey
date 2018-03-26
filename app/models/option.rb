class Option < ApplicationRecord
  has_many :guest_options
  has_many :guests,through: :guest_options

end
