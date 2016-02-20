
c = Client.find_or_initialize_by(
  email: 'richardrpanzer@gmail.com',
  name: 'Ricky Panzer',
  role: 2
)

c.password = "testtest"
c.save!

l = Laborer.find_or_initialize_by(
  email: 'r@gmail.com',
  name: 'R P',
  about: Faker::Lorem.sentence,
  role: 2
)

l.password = "testtest"
l.save!

#Creates Users
5.times do
  client = Client.create!(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest",
  role: 1
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
  password: "testtest",
  about:    Faker::Lorem.sentence,
  role: 1
  )
  # laborer.skip_confirmation!
  laborer.save!
end

laborers = Laborer.all


category_array = %w(Mulch Trees Mowing Garden Rocks Grass)

category_array.each do |c|
  Category.find_or_create_by(
    name: c
  )
end

categories = Category.all

10.times do
  Review.create!(
   title:   Faker::Hipster.word,
   author:  Faker::Name.name,
   content: Faker::Hipster.paragraph,
   rating:  3,
   laborer: laborers.sample
  )
end
  reviews = Review.all

# Creates jobs
20.times do
  Job.create!(
  title:       Faker::Hipster.word,
  description:    Faker::Hipster.paragraph,
  client: clients.sample,
  category: categories.sample,
  laborer: laborers.sample,



  # created_at: "2015-12-10 20:24:01"
  )
end

# Create an admin client
# admin = User.new(
#   name:     'Admin User',
#   email:    'admin@example.com',
#   password: 'testtest',
#   role:     'admin'
# )
# admin.skip_confirmation!
# admin.save!

jobs = Job.all

10.times do
  Submission.create!(
    price: "2..12",
    laborer: laborers.sample,
    job: jobs.sample

  )

end
submits = Submission.all


puts "Seed finished"
puts "#{Client.count}  clients created"
puts "#{Laborer.count}  laborers created"
puts "#{Submission.count} submits created"
puts "#{Job.count}  jobs created"
puts "#{Review.count} reviews created"
