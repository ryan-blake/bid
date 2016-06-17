class AddProfessionToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :profession_id, :integer
  end
end
