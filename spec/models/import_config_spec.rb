require "rails_helper"

RSpec.describe ImportConfig, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.first_page = Faker::Lorem.paragraphs
    subject.jobs_page_url =  Faker::Internet.domain_name
    subject.home_page = Faker::Internet.domain_name
    subject.config_name = Faker::Company.name
    expect(subject).to be_valid
  end

  it "should have a valid job title" do
    expect(subject).to_not be_valid
  end

  it "should have a valid first page" do
    subject.jobs_page_url =  Faker::Internet.domain_name
    subject.home_page = Faker::Internet.domain_name
    subject.config_name = Faker::Company.name
    expect(subject).to_not be_valid
  end

  it "is not valid without jobs page url" do
    subject.first_page = Faker::Lorem.paragraphs
    subject.home_page = Faker::Internet.domain_name
    subject.config_name = Faker::Company.name
    expect(subject).to_not be_valid
  end

  it "is not valid without config name" do
    subject.first_page = Faker::Lorem.paragraphs
    subject.jobs_page_url =  Faker::Internet.domain_name
    subject.home_page = Faker::Internet.domain_name
    expect(subject).to_not be_valid
  end
end
