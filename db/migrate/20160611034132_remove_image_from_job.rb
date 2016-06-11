class RemoveImageFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :image_data, :text
  end
end
