class ChangeImportConfigDbStructure < ActiveRecord::Migration[6.0]
  def change
    add_column :import_configs, :seed_click, :json
    add_column :import_configs, :first_page, :json
    add_column :import_configs, :second_page, :json
    add_column :import_configs, :next_page, :json


    remove_column :import_configs, :job_title
    remove_column :import_configs, :location
    remove_column :import_configs, :description
    remove_column :import_configs, :department
    remove_column :import_configs, :job_type
    remove_column :import_configs, :job_link
    remove_column :import_configs, :apply_link
    remove_column :import_configs, :email
    remove_column :import_configs, :full_import_date
    remove_column :import_configs, :base_url
    remove_column :import_configs, :start_url
    remove_column :import_configs, :employer

    add_column :import_configs, :job_count, :integer
    add_column :import_configs, :jobs_page_url, :string
    add_column :import_configs, :home_page, :string
    add_column :import_configs, :employer_override, :string, :default => :null
    add_column :import_configs, :location_override, :string, :default => :null
  end
end
