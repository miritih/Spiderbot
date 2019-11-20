FactoryBot.define do
  factory :employer do
    name { "Test Employer" }
    location { "Nairobi Kenya" }
    employer_type { Faker::Company.type }
    sector { Faker::Company.industry }
  end
end
