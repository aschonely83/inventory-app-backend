class Pallet < ApplicationRecord
  belongs_to :retailer
  validates :boxes, presence: true
end
