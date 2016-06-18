class AddClientToSubmission < ActiveRecord::Migration
  def change
    add_reference :submissions, :client, index: true, foreign_key: true
  end
end
