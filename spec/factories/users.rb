FactoryBot.define do
  factory :user do
    #transient :user do
      #person { Gimei.name }
    #end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'テスト'}
    last_name             {'四郎'}
    kfirst_name           {'テスト'}
    klast_name            {'シロウ'}
    birthday              {Faker::Date.backward}
  end
end