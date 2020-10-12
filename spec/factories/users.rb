FactoryBot.define do
  factory :user do
    nickname { 'sakana太郎' }
    email { 'sakana@maile' }
    password { 'sakana1111' }
    password_confirmation { password }
    first_name { '魚' }
    last_name { '太郎' }
    first_name_kana { 'サカナ' }
    last_name_kana { 'タロウ' }
    birthday { '2020-10-11' }
  end
end
