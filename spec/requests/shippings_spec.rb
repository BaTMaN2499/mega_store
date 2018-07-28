require 'rails_helper'

RSpec.describe 'Shippings', type: :request do
  describe 'GET /shippings/:id' do
    it 'renders the shipping correct attributes' do
      shipping = FactoryBot.create(:shipping)

      get shipping_path(shipping.id)

      expect(response_payload).to eq({
        id: shipping.id,
        address: shipping.address,
        info: shipping.receipt_info,
        purchase_id: shipping.purchase_id,
        status: shipping.status,
        created_at: shipping.created_at.as_json,
        updated_at: shipping.updated_at.as_json
      })
    end
  end

  describe 'PATCH /shippings/:id' do
    it 'updates the shipping status' do
      shipping = FactoryBot.create(:shipping, status: :waiting_clearance)
      params = { shipping: { status: :delivered } }

      expect {
        patch shipping_path(shipping.id), params: params
      }.to change{ shipping.reload.status }
      .from('waiting_clearance')
      .to('delivered')
    end
  end
end
