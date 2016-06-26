class AddRelsToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :job, :string
    add_column :charges, :price, :integer
    add_column :charges, :token, :string
    add_column :charges, :customer_id, :string
    add_column :charges, :completed, :boolean
  end
end
