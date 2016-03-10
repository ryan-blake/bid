class CreateSelectedSubmissions < ActiveRecord::Migration
  def change
    create_table :selected_submissions do |t|

      t.timestamps null: false
    end
  end
end
