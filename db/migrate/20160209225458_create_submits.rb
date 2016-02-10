class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.references :job, index: true, foreign_key: true

      t.integer :price

      t.timestamps null: false
    end
  end
end
