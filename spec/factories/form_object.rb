FactoryBot.define do
  factory :form_object do
    user_id { '1' }
    item_id { '1' }
    postal_code { '123-4567' }
    state_id { '1' }
    city { '北海道市' }
    address1 { '北海道1-1-1' }
    address2 { '北海道101' }
    telnumber { '08000000000' }
    token { 'tok_abcdefghijk0000000000000000' }
  end
end
