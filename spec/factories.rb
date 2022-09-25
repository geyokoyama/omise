FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 0..1000.0) }
    description { Faker::Lorem.paragraph }
    brand { Faker::Commerce.brand }
  end

end
