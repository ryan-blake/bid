class AddTimeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :time, :integer, :default
=> 7, :null => false
  end
end
