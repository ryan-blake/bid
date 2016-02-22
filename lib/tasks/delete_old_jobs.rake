namespace :delete do
  desc 'Delete old jobs'
  task :old_jobs => :environment do
    Job.where(':expire_date - :create_date = ?', 7).each do |j|
      j.destroy
    end
  end
end

#delete expired jobs

## Job.where('created_at < ?', @client.job.time.days.ago).each do |j|
