module Spiders
  class Base
    require "nokogiri"
    require "open-uri"

    def initialize
      @unlashed_employer = "TestEmployer"
    end

    def absolute_path(page_url, href)
      URI.join(page_url, href).to_s
    end

    def logger
      Rails.logger = Logger.new(STDOUT)
    end

    def log_with_time(msg, options = {})
      ms = Benchmark.ms { yield }
      if options[:scope].present?
        logger.info (options[:scope]) { "#{msg} (#{ms.round(1)}ms)" }
      else
        logger.info "#{msg} (#{ms.round(1)}ms)"
      end
    end

    def get_field_text(field)
      field.nil? ? nil : field.text.strip
    end

    def get_full_url(url, home_page)
      return if url.nil?

      full_url = url
      unless %w(http https).include?(URI.parse(url).scheme)
        full_url = absolute_path(home_page, url)
      end
      full_url
    end

    def get_field_attr(fields, attr)
      fields.map { |field| field[attr] }
    end

    # set employer for the config.
    def get_employer(name)
      Employer.find_by(name: name)
    end
  end
end
