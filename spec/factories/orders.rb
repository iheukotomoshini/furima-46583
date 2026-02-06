FactoryBot.define do
  factory :order do
    postal_code {"123-4568"}
    prefecture_id {35}
    city {"Z市"}
    addresses {"Y番地"}
    building {"Xビル"}
    phone_number {"09012345678"}
  end
end
