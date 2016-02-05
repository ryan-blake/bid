class AddClientRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :client, index: true, foreign_key: true
  end
end
