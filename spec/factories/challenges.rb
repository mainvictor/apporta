FactoryBot.define do
    factory :challenge do
      title { Faker::Lorem.word }
      description { Faker::Lorem.word }
      start_at {Faker::Date.between(20.days.ago, Date.today)}
      end_at  {start_at {Faker::Date.between(20.days.ago, Date.today)}}
      media {Faker::Internet.url('example.com')}
    end
  end