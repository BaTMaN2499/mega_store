FactoryBot.define do
  factory :product do
    name 'Candy Is Magic: Real Ingredients, Modern Recipe'
    base_price '52.99'
    stock 15
    association :store
  end
end
