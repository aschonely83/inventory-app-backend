class Retailer < ApplicationRecord
    has_many :pallets, :dependent => :destroy
end
