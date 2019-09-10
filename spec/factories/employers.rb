FactoryBot.define do
  factory :employer do
    name { Faker::Company.name }
    location { "Nairobi Kenya" }
    employer_type { Faker::Company.type }
    sector { Faker::Company.industry }
  end
end
