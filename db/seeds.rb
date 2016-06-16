
c = Client.find_or_initialize_by(
  email: 'ryan_blake@icloud.com',
  name: 'Ryan K',
  role: 2,
  zipcode: 76135
)
c.skip_confirmation!
c.password = "testtest"
c.save!

l = Laborer.find_or_initialize_by(
  email: 'ryan_blake@mac.com',
  name: 'R K',
  role: 2,
  zipcode: 76135
)
l.skip_confirmation!
l.about= Faker::Lorem.sentence
l.password = "testtest"
l.save!

#Creates Users
5.times do
  client = Client.create!(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest",
  role: 0,
  zipcode: 76244
    )
  client.skip_confirmation!
  client.save!
end
5.times do
  client = Client.create!(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest",
  role: 0,
  zipcode: 76262
    )
  client.skip_confirmation!
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
  role: 0,
  zipcode: 76244
  )
  laborer.skip_confirmation!
  laborer.save!
end
5.times do
  laborer = Laborer.new(
  # #3
  email:   Faker::Internet.email,
  name:     Faker::Name.name,
  password: "testtest",
  about:    Faker::Lorem.sentence,
  role: 0,
  zipcode: 76262
  )
  laborer.skip_confirmation!
  laborer.save!
end
laborers = Laborer.all



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

  category_array = %w(Mulch Trees Mowing Garden Rocks Grass Trimming)

  category_array.each do |c|
    Category.find_or_create_by(
      name: c
    )
  end
  categories = Category.all

# Creates jobs
10.times do
  Job.create!(
  title:       Faker::Hipster.word,
  description:    Faker::Hipster.paragraph,
  client: clients.sample,
  category: categories.sample,
  time: 7,
  zipcode: 76244
  # created_at: "2015-2-15 12:04:01"
  )
end
10.times do
  Job.create!(
  title:       Faker::Hipster.word,
  description:    Faker::Hipster.paragraph,
  client: clients.sample,
  category: categories.sample,
  time: 7,
  zipcode: 76262
  # created_at: "2015-2-15 12:04:01"
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

15.times do
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
