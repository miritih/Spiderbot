class RenameTypeToEmpolyerTypeOnEmployers < ActiveRecord::Migration[6.0]
  def change
    rename_column :employers, :type, :employer_type
  end
end
