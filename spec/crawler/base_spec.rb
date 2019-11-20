describe "Crawlers::Base crawler" do
  let!(:crawler) { Spiders::Base.new }
  let!(:employer) { create :employer }
  it "returns an asulute path absolute_path" do
    base = "http://example.com"
    url = "/jobs"
    expect(crawler.absolute_path(base, url)).to eq "http://example.com/jobs"
  end

  it "#get_field_text" do
    class A
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def text
          "exapmple text"
        end
      RUBY
    end
    expect(crawler.get_field_text(A.new)).to eq "exapmple text"
  end

  it "#get_ful_url" do
    base = "http://example.com"
    url = "/jobs"
    expect(crawler.get_full_url(url, base)).to eq "http://example.com/jobs"
  end

  it "#get_field_attr" do
    fields = [{ href: "http://www.test.com" }]
    expect(crawler.get_field_attr(fields, :href)).to eq ["http://www.test.com"]
  end

  it "#get_employer" do
    expect(crawler.get_employer(employer.name)).to eq employer
  end

  it "#log_with_time without scope" do
    log = crawler.log_with_time("message") { employer }
    expect(log).to eq true
  end
  it "#log_with_time with scope" do
    log = crawler.log_with_time("message", scope: employer.name) { employer }
    expect(log).to eq true
  end
end
