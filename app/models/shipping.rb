class Shipping < ApplicationRecord
  belongs_to :purchase

  enum status: {
    waiting_clearance: 'waiting_clearance',
    waiting_dispatch: 'waiting_dispatch',
    on_route: 'on_route',
    delivered: 'delivered'
  }

  def receipt_info
    <<~RECEIPT
      Thank you for your purchase #{purchase.customer.name}!

      Here are the items you bought:
      - x#{purchase.amount} #{purchase.product.name} - Unit Price: $#{purchase.price}

      Total: $#{purchase.price}
    RECEIPT
  end
end
