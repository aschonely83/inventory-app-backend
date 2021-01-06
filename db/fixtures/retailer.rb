Retailer.seed(:id,
  { :id => 1, :name => "Rothys" }
)

Pallet.seed(:id,
  {:id => 1, :retailer_id => 1, :boxes => "96" }
)