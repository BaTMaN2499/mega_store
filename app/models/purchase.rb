class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  belongs_to :store
  has_one :shipping

  def base_price
    product.base_price * amount
  end

  def final_price
    base_price + profit
  end

  def profit
    base_price * Product::PROFIT_PERCENTAGE
  end
end
