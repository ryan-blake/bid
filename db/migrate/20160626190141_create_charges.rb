class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :client, index: true, foreign_key: true
      t.references :laborer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
