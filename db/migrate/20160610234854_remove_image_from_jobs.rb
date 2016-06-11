class RemoveImageFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :file_id, :string
  end
end
