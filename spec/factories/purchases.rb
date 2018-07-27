FactoryBot.define do
  factory :purchase do
    amount 1
    association :product
    association :customer
    association :store
  end
end
