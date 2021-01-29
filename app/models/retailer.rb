class Retailer < ApplicationRecord
    has_many :pallets, :dependent => :destroy
    validates :name, presence: true
end
