FactoryBot.define do
  factory :purchase_menu do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {14}
    city {"B市"}
    addresses {"C番地"}
    building {"Dビル"}
    phone_number {"09012345678"}
  end
end
