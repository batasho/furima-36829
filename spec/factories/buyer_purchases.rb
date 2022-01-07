FactoryBot.define do
  factory :buyer_purchase do
    postal        { '123-4567' }
    area_id       { 4 }
    municipality  { '札幌市' }
    address       { '札幌1-1-1' }
    building      { 'ビル' }
    phone         { '08060009000' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
