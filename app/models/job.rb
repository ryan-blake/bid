# == Schema Information
#
# Table name: jobs
#
#  id                     :integer          not null, primary key
#  title                  :string
#  description            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  laborer_id             :integer
#  client_id              :integer
#  category_id            :integer
#  selected_submission_id :integer
#  time                   :integer
#  latitude               :float
#  longitude              :float
#  address1               :string
#  address2               :string
#  city                   :string
#  state                  :string
#  zipcode                :integer
#  hime                   :integer
#

class Job < ActiveRecord::Base
  belongs_to :laborer
  belongs_to :client
  belongs_to :category
  has_many :submissions
  has_one :selected_submission
  # accepts_nested_attributes_for :submits
  belongs_to :selected_submission, class_name: "Submission"

  default_scope { order('created_at DESC') }

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end
  def expiration_from
    created_at + @job.time.days
  end
  
  def expire_date
   a = created_at+time.days
   b = a.day
   b
  end
  def create_date
    a = created_at
     b = a.day
     b
   end
   def time_day
     c = time
     c
   end
end
