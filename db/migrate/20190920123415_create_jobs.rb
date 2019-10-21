class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.text :description
      t.string :type
      t.string :link
      t.string :department
      t.string :apply_link
      t.string :apply_email

      t.timestamps
    end
  end
end
