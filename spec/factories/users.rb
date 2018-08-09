FactoryBot.define do
    factory :user do
      name { Faker::Name.first_name }
      email 'vjuliodesarrollo@gmail.com'
      password 'd3s4rr0ll0'
    end
  end