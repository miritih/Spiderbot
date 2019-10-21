FactoryBot.define do
  factory :job do
    title { "MyString" }
    location { "MyString" }
    description { "MyText" }
    job_type { "" }
    link { "MyString" }
    department { "MyString" }
    apply_link { "MyString" }
    apply_email { "MyString" }
    association :employer, factory: :employer
  end
end
