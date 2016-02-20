class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.string :content
      t.integer :rating
      t.references :laborer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
