class AddLatAndLonToLaborer < ActiveRecord::Migration
  def change
    add_column :laborers, :latitude, :float
    add_column :laborers, :longitude, :float
  end
end
