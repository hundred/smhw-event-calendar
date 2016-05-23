FactoryGirl.define do
  factory :event do
    title "Cool event"
    description { Faker::Lorem.sentence(2) }
    info { Faker::Name.name }
    start_time { Date.today }
    end_time { Date.today + 1.day }
  end
end
