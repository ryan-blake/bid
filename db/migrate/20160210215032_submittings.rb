class Submittings < ActiveRecord::Migration
  def change
      create_table :submittings do |t|
        t.references :submit, index: true
        # #8
        t.references :submittable, polymorphic: true, index: true
        t.timestamps null: false
      end
      add_foreign_key :labelings, :submit
    end
end
