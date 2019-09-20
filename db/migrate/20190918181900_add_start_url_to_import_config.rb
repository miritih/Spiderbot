class AddStartUrlToImportConfig < ActiveRecord::Migration[6.0]
  def change
    add_column :import_configs, :start_url, :string
  end
end
