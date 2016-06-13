class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :category
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :distance
      t.decimal :days
      t.boolean :images

      t.timestamps null: false
    end
  end
end
