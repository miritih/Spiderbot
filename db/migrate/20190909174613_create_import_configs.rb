class CreateImportConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :import_configs do |t|
      t.string :job_title, null: false
      t.string :location
      t.string :description, null: false
      t.string :job_type
      t.string :job_link, null: false
      t.string :department, default: nil
      t.string :apply_link
      t.string :email
      t.timestamps
    end
  end
end
