class ChangeImportConfigDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :import_configs, :description, :text
  end
end
