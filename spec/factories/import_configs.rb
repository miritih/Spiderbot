FactoryBot.define do
  factory :import_config do
    jobs_page_url { "https://www.brightermonday.co.ke/jobs" }
    home_page { "https://www.brightermonday.co.ke" }
    employer_override { "Test Employer" }
    location_override { "" }
    config_name { "Test Config" }
    job_count { 5 }
    seed_click do
      {
        "1": "(//article[@class=\"search-result \"]//a)[1]",
        "2": "//ul/li[@class=\"breadcrumb__list-item\"][last()-1]/a"
      }
    end
    first_page do
      {
        "JOB_TITLE": "(//article[@class=\"search-result \"]//a)[1]",
        "JOB_LOCATION": "(//article[@class=\"search-result \"]//a)[1]",
        "JOB_LISTING_URL": "(//article[@class=\"search-result \"]//a)[1]",
        "ID_FROM_SOURCE": "(//article[@class=\"search-result \"]//a)[1]"
      }
    end
    second_page do
      {
        "JOB_DESCRIPTION": "//div[@class=\"job__details__user-edit\"]"
      }
    end
    next_page do
      {
        "nextPageXpath": "(//li[@class=\"page-item\"]/a[contains(text(),4)])[1]"
      }
    end
  end
end
