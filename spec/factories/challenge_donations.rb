FactoryBot.define do
    factory :challenge_donation do
      media {Faker::Internet.url('example.com')}
      city {Faker::Nation.capital_city}
      description { Faker::Lorem.word }
      lat {Faker::Number.decimal(2, 4)}
      lng {Faker::Number.decimal(2, 4)}
      challenge_id nil
    end
  end