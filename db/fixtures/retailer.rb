Retailer.seed(:id,
  { :id => 1, :name => "Nike" }
)

Pallet.seed(:id,
  {:id => 1, :retailer_id => 1, :boxes => "96" }
)