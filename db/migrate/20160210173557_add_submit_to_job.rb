class AddSubmitToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :price, :integer
  end
end
