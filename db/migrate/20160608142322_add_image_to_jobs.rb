class AddImageToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :file_id, :string
  end
end
