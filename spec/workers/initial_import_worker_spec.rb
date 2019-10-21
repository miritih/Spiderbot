require "sidekiq/testing"
Sidekiq::Testing.fake!

RSpec.describe InitialImport, type: :worker do
  describe "Initial Import Worker" do
    let!(:import_config) { create :import_config }
    let!(:employer) do
      Employer.create(
        name: "Test Employer",
        location: "Nairobi Kenya",
        employer_type: Faker::Company.type,
      )
    end

    before(:each) do
      Sidekiq::Worker.clear_all
    end
    it "should respond to #perform" do
      expect(InitialImport.new).to respond_to(:perform)
    end

    it "should push jobs to the queue" do
      assert_equal 0, InitialImport.jobs.size
      InitialImport.perform_async(1, 2)
      assert_equal 1, InitialImport.jobs.size
    end

    it "should queue and execute jobs" do
      InitialImport.perform_async(import_config.id)
      assert_equal 1, InitialImport.jobs.size
      InitialImport.drain
      assert_equal 0, InitialImport.jobs.size
    end
  end
end
