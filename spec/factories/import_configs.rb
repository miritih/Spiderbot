FactoryBot.define do
  factory :import_config do
    job_title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    job_type { Faker::Job.employment_type }
    job_link { Faker::Internet.domain_name }
    department { Faker::Job.field }
    apply_link { Faker::Internet.domain_name }
    email { Faker::Internet.email }
  end
end
