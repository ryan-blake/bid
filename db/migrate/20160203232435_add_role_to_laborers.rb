class AddRoleToLaborers < ActiveRecord::Migration
  def change
    add_column :laborers, :role, :integer

  end
end
