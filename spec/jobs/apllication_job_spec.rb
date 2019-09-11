RSpec.describe ApplicationJob, type: :job do
  describe "#application job" do
    it "sets queue adapter" do
      ActiveJob::Base.queue_adapter = :test
    end
  end
end
