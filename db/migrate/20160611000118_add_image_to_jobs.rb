class AddImageToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :image_data, :text
  end
end
