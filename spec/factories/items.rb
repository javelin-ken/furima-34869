FactoryBot.define do
  factory :item do
    name {"ケーキ"}
    description {"大変美味しいケーキです"}
    category_id {2}
    condition_id {2}
    shipping_cost_id {2}
    shipping_origin_id {2}
    shipping_day_id {2}
    price {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
