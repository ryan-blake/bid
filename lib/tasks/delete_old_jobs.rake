namespace :delete do
  desc 'Delete old jobs'
  task :old_jobs => :environment do

    jobs = Job.where('created_at + time*3600*24 < ?', Time.now)
    # jobs = Job.where(':expire_date - :create_date >= ?', :time)
    # puts jobs
    puts jobs.count
    jobs.each do |j|
      puts j.title
      j.destroy
    end
  end
end

#delete expired jobs

## Job.where('created_at < ?', @client.job.time.days.ago).each do |j|
