class SelectedSubmission < ActiveRecord::Base
  has_many: jobs
  has_many: clients
  has_many: laborers
end
