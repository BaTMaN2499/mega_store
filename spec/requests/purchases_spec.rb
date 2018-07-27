require 'rails_helper'

RSpec.describe 'purchases', type: :request do
  describe 'post /products/:product_id/purchases' do
    it 'creates a new purchase with the correct attributes' do
      product = FactoryBot.create(:product)
      customer = FactoryBot.create(:customer)
      params = { purchase: { customer_id: customer.id, amount: 1 } }

      expect {
        post product_purchases_path(product_id: product.id), params: params
      }.to change(Purchase, :count).by(1)

      expect(Purchase.last).to have_attributes(
        amount: 1,
        product_id: product.id,
        customer_id: customer.id,
        store_id: product.store.id
      )
    end

    it 'creates a new shipping with the correct attributes and associated to the purchase' do
      product = FactoryBot.create(:product)
      customer = FactoryBot.create(:customer)
      params = { purchase: { customer_id: customer.id, amount: 1 } }

      expect {
        post product_purchases_path(product_id: product.id), params: params
      }.to change(Shipping, :count).by(1)

      expect(Shipping.last).to have_attributes(address: customer.address)
      expect(Purchase.last.shipping).to eq(Shipping.last)
    end

    it 'reduces the stock of the product by the amount purchased' do
      product = FactoryBot.create(:product)
      customer = FactoryBot.create(:customer)
      params = { purchase: { customer_id: customer.id, amount: 3 } }

      expect {
        post product_purchases_path(product_id: product.id), params: params
      }.to change{ product.reload.stock }.by(-3)
    end

    it 'renders a unprocessable entity error when there are not enough products on stock' do
      product = FactoryBot.create(:product, stock: 0)
      customer = FactoryBot.create(:customer)
      params = { purchase: { customer_id: customer.id, amount: 1 } }

      post product_purchases_path(product_id: product.id), params: params

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_payload[:errors]).to contain_exactly('The purchase could not be completed.')
    end
  end
end
