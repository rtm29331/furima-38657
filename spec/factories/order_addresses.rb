FactoryBot.define do
  factory :order_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    postal_code      { '123-1234' }
    shipping_area_id { 2 }
    city_name        { '豊島区' }
    block_name       { 'テスト町1-1-1' }
    buliding_name    { 'テストビル101' }
    phone_number     { '09012345678' }
  end
end
