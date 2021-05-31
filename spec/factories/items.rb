FactoryBot.define do
  factory :item do
    title         {Faker::Name.initials}
    text          {Faker::Lorem.sentence}
    category_id   {1}
    state_id      {2}
    fee_id        {1}
    prefectures_id {2}
    days_ship_id  {1}
    price         {345}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test.jpg'), filename: 'test.jpg')
    end
  end

end
