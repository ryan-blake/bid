class AddSelectedSubmissionToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :selected_submission, index: true, foreign_key: true
  end
end
