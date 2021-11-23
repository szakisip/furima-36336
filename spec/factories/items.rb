FactoryBot.define do
  factory :item do
    association :user

    product_name       {'itemtest'}
    description        {'itemitem'}
    category_id        {'1'}
    condition_id       {'1'}
    shipping_charge_id {'1'}
    state_id           {'1'}
    shipping_day_id    {'1'}
    price              {'300'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
