FactoryBot.define do
  factory :shipping_order do
    postal_code   {"111-1111"}
    prefecture_id {1}
    municipality  {"あア漢字"}
    address       {"あア漢字１"}
    building {"あア漢字１"}
    phone_number {"09012345678"}
  end
end