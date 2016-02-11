class AddSubmitToLaborer < ActiveRecord::Migration
  def change
    add_reference :laborers, :job, index: true, foreign_key: true
  end
end
