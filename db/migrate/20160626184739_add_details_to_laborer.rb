class AddDetailsToLaborer < ActiveRecord::Migration
  def change
    add_column :laborers, :publishable_key, :string
    add_column :laborers, :provider, :string
    add_column :laborers, :uid, :string
    add_column :laborers, :access_code, :string
  end
end
