class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :client, index: true, foreign_key: true
      t.references :laborer, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.text :receipt

      t.timestamps null: false
    end
  end
end
