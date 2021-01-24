class RetailerPalletSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :active
  has_many :pallets
end
