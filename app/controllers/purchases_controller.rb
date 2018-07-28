class PurchasesController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    customer = Customer.find(purchase_params[:customer_id])
    purchase = product.buy(customer, purchase_params[:amount])

    if purchase
      render json: purchase
    else
      message = 'The purchase could not be completed.'
      render json: { errors: [message] }, status: 422
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:customer_id, :amount)
  end
end
