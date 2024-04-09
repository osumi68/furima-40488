FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6, mix_case: false, special_characters: false) + '1a'}
    password_confirmation {password}
    family_name  { '佐藤' }
    first_name { '二郎' }
    family_name_kana  { 'サトウ' }
    first_name_kana  { 'ジロウ' }
    birthday {Faker::Date.birthday}
  end
end