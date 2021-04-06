FactoryBot.define do
  factory :purchase_address do
    postal_code {'111-1111'}
    shipping_origin_id {2}
    city_town_village {'長岡市'}
    address {'1-1'}
    building {'ハイツ長岡'}
    phone_number {'09000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
