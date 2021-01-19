class Retailer < ApplicationRecord
    has_many :pallets

    validates :name, presence: true;
end
