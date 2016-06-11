class AddJobIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :job, index: true, foreign_key: true
  end
end
