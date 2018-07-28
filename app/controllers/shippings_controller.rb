class ShippingsController < ApplicationController
  def update
    shipping = Shipping.find(params[:id])

    if shipping.update(status: shipping_params[:status])
      render json: shipping
    else
      render json: { errors: shipping.errors.full_messages }, status: 422
    end
  end

  def show
    shipping = Shipping.find(params[:id])
    shipping_data = shipping.as_json.merge(info: shipping.receipt_info)

    render json: shipping_data
  end

  private

  def shipping_params
    params.require(:shipping).permit(:status)
  end
end
