RSpec.describe Job, type: :model do
  subject { described_class.new }
  let!(:employer){create :employer}

  it "is valid with valid attributes" do
    subject.employer_id = employer.id
  end

  it "is not valid without employer id" do
    expect(subject).to_not be_valid
  end
end
