class AddStripeConnectFieldsToLaborer < ActiveRecord::Migration
  def change
    add_column :laborers, :stripe_id, :string
    add_column :laborers, :stripe_access_key, :string
    add_column :laborers, :stripe_publishable_key, :string
    add_column :laborers, :stripe_refresh_token, :string
  end
end
