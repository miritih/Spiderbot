class AddEmployerToImportConfig < ActiveRecord::Migration[6.0]
  def change
    add_column :import_configs, :employer, :string
    add_column :import_configs, :full_import_date, :datetime
    add_column :import_configs, :base_url, :string
  end
end
