FactoryBot.define do
  factory :shipping do
    address 'Winterfell Castle, North of Westeros'
    status :waiting_for_clearance
    association :purchase
  end
end
