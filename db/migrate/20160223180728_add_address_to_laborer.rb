class AddAddressToLaborer < ActiveRecord::Migration
  def change
    add_column :laborers, :address1, :string
    add_column :laborers, :address2, :string
    add_column :laborers, :city, :string
    add_column :laborers, :state, :string
    add_column :laborers, :zipcode, :integer
  end
end
