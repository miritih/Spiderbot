FactoryBot.define do
  factory :import_config do
    job_title { "(//div[@class=\"opening\"]/a)[1]" }
    location { "(//div[@class=\"opening\"]/span[@class=\"location\"])[1]" }
    description { "//div[@id=\"content\"]" }
    job_type { " " }
    job_link { "(//div[@class=\"opening\"]/a)[1]" }
    department { "preceding::h3[1]" }
    apply_link { "(//div[@class=\"opening\"]/a)[1]" }
    email { " " }
    start_url { "https://boards.greenhouse.io/andela" }
    employer { "Test Employer" }
    base_url { "https://boards.greenhouse.io" }
  end
end
