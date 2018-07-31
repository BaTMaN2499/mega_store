class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :customer
  belongs_to :store
  has_one :shipping

  def base_price
    product.base_price * amount
  end

  def price
    base_price + service_tax
  end

  def service_tax
    base_price * Product::SERVICE_TAX_PERCENTAGE
  end
end
