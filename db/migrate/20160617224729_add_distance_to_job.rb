class AddDistanceToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :distance_id, :integer
    add_reference :jobs, :job, index: true, foreign_key: true
  end
end
