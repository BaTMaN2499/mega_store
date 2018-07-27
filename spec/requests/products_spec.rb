require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /stores/:store_id/products' do
    it 'renders the list of products for the given store' do
      product = FactoryBot.create(:product)

      get store_products_path(store_id: product.store.id)

      rendered_ids = response_payload.map{ |r| r[:id] }
      expect(rendered_ids).to contain_exactly(product.id)
    end

    it 'renders the correct product attributes' do
      product = FactoryBot.create(:product)

      get store_products_path(store_id: product.store_id)

      expect(response_payload.first).to eq({
        id: product.id,
        name: product.name,
        base_price: product.base_price.as_json,
        stock: product.stock,
        store_id: product.store_id,
        created_at: product.created_at.as_json,
        updated_at: product.updated_at.as_json
      })
    end
  end

  describe 'GET /products/:id' do
    it 'renders the given product attributes' do
      product = FactoryBot.create(:product)

      get product_path(product.id)

      expect(response_payload).to eq({
        id: product.id,
        name: product.name,
        base_price: product.base_price.as_json,
        stock: product.stock,
        store_id: product.store_id,
        created_at: product.created_at.as_json,
        updated_at: product.updated_at.as_json
      })
    end
  end
end
