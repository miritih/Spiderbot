RSpec.describe Employer, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name =  Faker::Company.name
    subject.location = "Nairobi Kenya"
    subject.employer_type = Faker::Company.type
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a location" do
    subject.name = Faker::Company.name
    subject.employer_type = Faker::Company.type
    expect(subject).to_not be_valid
  end

  it "is not valid without employer_type" do
    subject.name = Faker::Company.name
    subject.location = "Nairobi Kenya"
    expect(subject).to_not be_valid
  end
end
