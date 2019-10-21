namespace :import do
  desc "initial jobs import"
  task initial: :environment do
    imp = ImportConfig.first
    InitialImport.perform_async(imp.id)
  end

  desc "TODO"
  task incremental: :environment do
  end
end
