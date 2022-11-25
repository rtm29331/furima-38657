FactoryBot.define do
  factory :item do
    title              { Faker::Name.name }
    description        { Faker::Lorem.sentence }
    category_id        { 2 }
    status_id          { 2 }
    shipping_charge_id { 2 }
    shipping_area_id   { 2 }
    shipping_day_id    { 2 }
    price              { 12_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
