class AddConigNameToImportConfig < ActiveRecord::Migration[6.0]
  def change
    add_column :import_configs, :config_name, :string
  end
end
