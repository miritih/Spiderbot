module WebCrawler
  class WebBot < WebCrawler::Base
    def initialize(config)
      start_crawling(config)
    end

    def start_crawling(config)
      @doc = Nokogiri::HTML(URI.parse(config.jobs_page_url).open)
      @first_page = {}
      @second_page = {}
      @jobs = {}
      @page = 1
      @home_page = config.home_page
      logger.info "Preparing to start scraping jobs"
      if config.seed_click.empty?
        first_page_crawl(@doc, config)
        config.second_page.empty? ? @first_page : desc_page_crawl(@doc, config)
        persist_jobs(config)
      else
        seed_click(config)
        first_page_crawl(@doc, config)
      end
    end

    def persist_jobs(config)
      logger.info "............Preparing to store jobs.............."
      @jobs.each do |_index, job|
        log_with_time("Saving Job", scope: get_field_text(job["job_title"])) do
          job_listing = job["job_listing_url"][:href]
          job_employer = get_field_text(job["job_employer"])
          job_location = get_field_text(job["job_location"])
          # find job or create a new one
          saved_job = Job.find_or_create_by(
            job_title: get_field_text(job["job_title"]),
            id_from_source: job["id_from_source"][:href],
          )
          # update job
          saved_job.update(
            job_type: get_field_text(job["job_type"]),
            job_city: get_field_text(job["job_city"]),
            job_category: get_field_text(job["job_category"]),
            job_compensation: get_field_text(job["job_compensation"]),
            expire_date: get_field_text(job["expire_date"]),
            job_employer: job_employer || config.employer_override,
            job_listing_url: get_full_url(job_listing, @home_page),
            job_location: job_location || config.location_override,
            apply_to_email: get_field_text(job["apply_to_email"]),
            job_description: job["job_description"].to_html,
            job_source_ad_target: get_field_text(job["job_source_ad_target"]),
            job_state: get_field_text(job["job_state"]),
            job_country: get_field_text(job["job_country"]),
            job_date: get_field_text(job["job_date"]),
            postal_code: get_field_text(job["postal_code"]),
            job_title: get_field_text(job["job_title"]),
          )
        end
      end
    end

    # click though to job listings page
    def seed_click(config)
      config.seed_click.each do |key, value|
        logger.info "Opening seed click #{key}"
        sd = @doc.xpath(value)
        seed = get_field_attr(sd, :href)[0]
        link = get_full_url(seed, @home_page)
        @doc = Nokogiri::HTML(URI.parse(link).open)
      end
    end

    # crawl job listings page
    def first_page_crawl(doc, config)
      logger.info "Crawling page ##{@page}"
      config.first_page.each do |key, value|
        next if value.empty?

        if @first_page.key?(key)
          @first_page[key] += doc.xpath(value).to_a
        else
          @first_page[key] = doc.xpath(value).to_a
        end
      end
      while next_page(@doc, config)
        @page += 1
        first_page_crawl(@doc, config)
      end
    end

    # crawl job listings page
    def next_page(doc, config)
      lnk = doc.xpath(config.next_page["nextPageXpath"])
      link = get_field_attr(lnk, :href)[0]
      return if link.nil? || @page == 100

      full_url = get_full_url(link, @home_page)
      logger.info "Opening next page"
      @doc = Nokogiri::HTML(URI.parse(full_url).open)
    end

    def desc_page_crawl(_doc, config)
      logger.info "Crawling job descriptions"
      links = get_field_attr(@first_page["JOB_LISTING_URL"], :href)
      links.each_with_index do |link, index|
        link = get_full_url(link, @home_page)
        log_with_time("Opening description page", scope: index + 1) do
          @desc = Nokogiri::HTML(URI.parse(link).open)
        end
        job = {}
        @first_page.keys.each { |k| job[k.downcase] = @first_page[k][index] }
        config.second_page.each do |key, value|
          next if value.empty?

          job[key.downcase] = @desc.xpath(value)
        end
        @jobs[index] = job
      end
    end
  end
end
