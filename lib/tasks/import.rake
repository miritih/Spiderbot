namespace :import do
  desc "initial jobs import"
  task initial: :environment do
    config = ImportConfig.find(5)
    # crawler = WebBot.new(config)
    InitialImport.perform_async(config.id)
  end

  desc "TODO"
  task incremental: :environment do
  end
end
