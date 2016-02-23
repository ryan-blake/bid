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
#  zip                    :integer
#

class Job < ActiveRecord::Base
  belongs_to :laborer
  belongs_to :client
  belongs_to :category
  has_many :submissions
  # accepts_nested_attributes_for :submits
  belongs_to :selected_submission, class_name: "Submission"

  default_scope { order('created_at DESC') }

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
