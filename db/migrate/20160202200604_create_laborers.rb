class CreateLaborers < ActiveRecord::Migration
  def change
    create_table :laborers do |t|
      t.string :name
      t.string :about
      t.integer :laborer_id
      
      t.timestamps null: false
    end
  end
end
