class ReadRelationship < ApplicationRecord
  belongs_to :user,:optional=>true
  belongs_to :house ,:optional=>true
end
