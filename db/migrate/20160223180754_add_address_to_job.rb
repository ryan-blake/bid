class AddAddressToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :address1, :string
    add_column :jobs, :address2, :string
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
    add_column :jobs, :zipcode, :integer
  end
end
