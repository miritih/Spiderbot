FactoryBot.define do
  factory :job do
    job_title { "MyString" }
    job_location { "MyString" }
    job_type { "" }
    id_from_source { "MyString" }
    job_city {}
    job_category { "MyString" }
    job_compensation { "MyString" }
    expire_date { "MyString" }
    job_employer { "Test Employer" }
    job_listing_url { "MyString" }
    apply_to_email { "MyString" }
    job_description { "MyString" }
    job_source_ad_target { "MyString" }
    job_state { "MyString" }
    job_country { "MyString" }
    job_date { "MyString" }
    postal_code { "MyString" }
  end
end
