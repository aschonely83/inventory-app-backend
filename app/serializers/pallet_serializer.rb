class PalletSerializer
  include FastJsonapi::ObjectSerializer
  attributes :boxes, :retailer
  belongs_to :retailer
end
