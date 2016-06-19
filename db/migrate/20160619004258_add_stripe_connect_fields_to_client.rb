class AddStripeConnectFieldsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :stripe_id, :string
    add_column :clients, :stripe_access_key, :string
    add_column :clients, :stripe_publishable_key, :string
    add_column :clients, :stripe_refresh_token, :string
  end
end
