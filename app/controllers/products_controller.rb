class ProductsController < ApplicationController
  def index
    store = Store.find(params[:store_id])
    render json: store.products
  end

  def show
    render json: Product.find(params[:id])
  end
end
