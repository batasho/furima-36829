FactoryBot.define do
  factory :item do
    name               {Faker::String.random}
    explaration        {Faker::String.random}
    category_id        {2}
    status_id          {3}
    charge_id          {2}
    area_id            {4}
    shipping_day_id    {2}
    price              {3333}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end