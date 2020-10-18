FactoryBot.define do
  factory :purchaser_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    addresses { '青山' }
    building { 'ビル' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
