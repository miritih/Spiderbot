namespace :import do
  desc "initial jobs import"
  task initial: :environment do
    config = ImportConfig.find(2)
    crawler = WebBot.new(config)
  end

  desc "TODO"
  task incremental: :environment do
  end
end
