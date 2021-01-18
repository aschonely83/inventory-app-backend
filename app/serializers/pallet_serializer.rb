class PalletSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :boxes, :retailer_id
  #belongs_to :retailer
end
