class InitialImport
  require "nokogiri"
  require "open-uri"
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(config_id)
    config = ImportConfig.find(config_id)
    WebCrawler::WebBot.new(config)
  end
end
