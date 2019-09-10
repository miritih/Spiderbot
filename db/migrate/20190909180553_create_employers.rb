class CreateEmployers < ActiveRecord::Migration[6.0]
  def change
    create_table :employers do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :type
      t.string :sector

      t.timestamps
    end
  end
end
