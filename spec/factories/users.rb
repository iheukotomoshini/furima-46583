FactoryBot.define do
  factory :user do
    nickname              {'kuma'}
    email                 {'test@test'}
    password              {'1234ab'}
    password_confirmation {password}
    family_name           {"山田"}
    last_name             {"太郎"}
    family_name_kana      {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {Date.new(1990, 1, 1)}
  end
end
