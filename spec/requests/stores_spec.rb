require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  describe 'GET /stores' do
    it 'renders the list of stores' do
      store = FactoryBot.create(:store)

      get stores_path

      rendered_ids = response_payload.map{ |r| r[:id] }
      expect(rendered_ids).to contain_exactly(store.id)
    end

    it 'renders the correct store attributes' do
      store = FactoryBot.create(:store)

      get stores_path

      expect(response_payload.first).to eq({
        id: store.id,
        name: store.name,
        address: store.address,
        created_at: store.created_at.as_json,
        updated_at: store.updated_at.as_json
      })
    end
  end
end
