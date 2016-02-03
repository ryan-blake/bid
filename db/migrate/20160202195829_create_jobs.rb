class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.integer :job_id
      
      t.timestamps null: false
    end
  end
end
