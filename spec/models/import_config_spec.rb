require "rails_helper"

RSpec.describe ImportConfig, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.job_title = Faker::Job.title
    subject.description = Faker::Lorem.paragraphs
    subject.job_link =  Faker::Internet.domain_name
    expect(subject).to be_valid
  end

  it "is not valid without a job title" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.job_title = Faker::Job.title
    subject.job_link =  Faker::Internet.domain_name
    expect(subject).to_not be_valid
  end

  it "is not valid without job link" do
    subject.job_title = Faker::Job.title
    subject.description = Faker::Lorem.paragraphs
    expect(subject).to_not be_valid
  end
end
