
#Creates Users
5.times do
  client = Client.new(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest"
  )
  # client.skip_confirmation!
  client.save!
end
clients = Client.all

#Creates Users
5.times do
  laborer = Laborer.new(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest"
  )
  # laborer.skip_confirmation!
  laborer.save!
end
laborers = Laborer.all


# Creates i
20.times do
  Job.create!(
  title:       Faker::Hipster.word,
  description:    Faker::Hipster.paragraph,
  job_id:   clients.sample,
  # created_at: "2015-12-10 20:24:01"
  )
end

# Create an admin user
# admin = User.new(
#   name:     'Admin User',
#   email:    'admin@example.com',
#   password: 'testtest',
#   role:     'admin'
# )
# admin.skip_confirmation!
# admin.save!

jobs = Job.all


puts "Seed finished"
puts "#{Client.count}  clients created"
puts "#{Laborers.count}  laborers created"
puts "#{Job.count}  jobs created"
