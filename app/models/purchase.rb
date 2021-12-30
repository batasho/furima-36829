class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  has_one :buyer
  belongs_to :user
end
