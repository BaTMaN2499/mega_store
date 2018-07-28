FactoryBot.define do
  factory :shipping do
    address 'Winterfell Castle, North of Westeros'
    status :waiting_clearance
    association :purchase
  end
end
