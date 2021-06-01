class StockistBrand < ApplicationRecord
  belongs_to :brand
  belongs_to :stockist
end
