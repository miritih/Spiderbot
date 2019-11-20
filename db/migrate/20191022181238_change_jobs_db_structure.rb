class ChangeJobsDbStructure < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :id_from_source, :string
    add_column :jobs, :job_city, :string
    add_column :jobs, :job_category, :string
    add_column :jobs, :job_compensation, :string
    add_column :jobs, :expire_date, :string
    add_column :jobs, :job_employer, :string
    add_column :jobs, :job_listing_url, :string
    add_column :jobs, :job_location, :string
    add_column :jobs, :apply_to_email, :string
    add_column :jobs, :job_description, :text
    add_column :jobs, :job_source_ad_target, :string
    add_column :jobs, :job_state, :string
    add_column :jobs, :job_country, :string
    add_column :jobs, :job_date, :string
    add_column :jobs, :postal_code, :string
    add_column :jobs, :job_title, :string

    remove_column :jobs, :department
    remove_column :jobs, :employer_id
    remove_column :jobs, :link
    remove_column :jobs, :title
    remove_column :jobs, :location
    remove_column :jobs, :description
    remove_column :jobs, :apply_link
    remove_column :jobs, :apply_email
  end
end
