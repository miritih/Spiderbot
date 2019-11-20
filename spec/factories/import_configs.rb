FactoryBot.define do
  factory :import_config do
    jobs_page_url { "https://boards.greenhouse.io/andela" }
    home_page { "https://boards.greenhouse.io" }
    employer_override { "Test Employer" }
    location_override { "" }
    config_name { "Test Config" }
    job_count { 5 }
    seed_click {{}}
    first_page do
      {
        "JOB_TITLE": "(//div[@class=\"opening\"]/a)[1]",
        "JOB_LOCATION": "(//div[@class=\"opening\"]/a)[1]",
        "JOB_LISTING_URL": "(//div[@class=\"opening\"]/a)[1]",
        "ID_FROM_SOURCE": "(//div[@class=\"opening\"]/a)[1]"
      }
    end
    second_page do
      {
        "JOB_DESCRIPTION": "//div[@id=\"content\"]"
      }
    end
    next_page {{}}
  end
end
