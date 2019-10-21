class InitialImport
  require "nokogiri"
  require "open-uri"
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(config_id)
    logger.info "loading configs"
    config = ImportConfig.find(config_id)
    logger.info "opening start url"
    doc = Nokogiri::HTML(URI.parse(config.start_url).open)
    logger.info "first page crawling"
    employer = Employer.find_by(name: config.employer)
    log_with_time("") do
    end
    log_with_time("Crawled firt page details", scope: employer.name) do
      @titles = doc.xpath(config.job_title).map(&:content)
      @links = doc.xpath(config.job_link).map { |title| title[:href] }
      @locations = doc.xpath(config.location).map(&:content)
      @type = config.job_type.empty? ? "Full Time" : config.job_type
      @departments = match_with_title(config, doc)
    end

    description_from_links(
      links: @links,
      employer: employer,
      config: config,
      titles: @titles,
      locations: @locations,
      type: @type,
      departments: @departments,
    )
  end

  def absolute_path(page_url, href)
    URI.join(page_url, href).to_s
  end

  def logger
    Rails.logger = Logger.new(STDOUT)
  end

  def match_with_title(config, doc)
    departments = {}
    doc.xpath(config.job_title).each_entry do |title|
      ttl = title.children.text
      departments[ttl] = title.xpath(config.department).children.text
    end
    departments
  end

  def description_from_links(opt = {})
    logger.info "Clicks links to crawl jobs "
    opt[:links].each_with_index do |link, index|
      title = opt[:titles][index]
      log_with_time("Imported #{title}", scope: opt[:employer].name) do
        desc = Nokogiri::HTML(
          URI.parse("#{opt[:config].base_url}#{link}").open,
        )
        description = desc.xpath(opt[:config].description).children.to_html

        job_link = absolute_path(opt[:config].base_url, link)
        job = Job.find_or_create_by(
          title: title,
          location: opt[:locations][index],
        )
        job.update(
          description: description,
          link: job_link,
          apply_link: job_link,
          employer: opt[:employer],
          job_type: opt[:type],
          department: opt[:departments][job.title],
        )
      end
    end
  end

  def log_with_time(msg, options = {})
    ms = Benchmark.ms { yield }
    if options[:scope].present?
      logger.info (options[:scope]) { "#{msg} (#{ms.round(1)}ms)" }
    else
      logger.info "#{msg} (#{ms.round(1)}ms)"
    end
  end
end
