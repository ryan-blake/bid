# class ApplicationRecord < ActiveRecord::Base
#   self.abstract_class = true
# end
# 2.4 ActiveJob jobs now inherit from ApplicationJob by default
# In Rails 4.2 an ActiveJob inherits from ActiveJob::Base. In Rails 5.0 this behavior has changed to now inherit from ApplicationJob.
#
# When upgrading from Rails 4.2 to Rails 5.0 you need to create an application_job.rb file in app/jobs/ and add the following content:
#
# class ApplicationJob < ActiveJob::Base
# end
# Then make sure that all your job classes inherit from it.
#
# See #19034 for more details.
# r5
