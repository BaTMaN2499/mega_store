class PurchasesController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    purchase = product.buy(current_user, params[:amount])

    if purchase
      render json: purchase
    else
      message = 'The purchase could not be completed.'
      render json: { errors: [message] }, status: 422
    end
  end
end
