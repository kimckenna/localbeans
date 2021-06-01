class StockistBrand < ApplicationRecord
  belongs_to :brand
  belongs_to :stockist

  #validates_uniqueness_of :stockist_id, :scope => :brand_id
end
