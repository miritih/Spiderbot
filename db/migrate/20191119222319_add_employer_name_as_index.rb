class AddEmployerNameAsIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :employers, :name, unique: true
  end
end
