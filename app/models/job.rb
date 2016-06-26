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
#  time                   :integer          default(7), not null
#  latitude               :float
#  longitude              :float
#  address1               :string
#  address2               :string
#  city                   :string
#  state                  :string
#  zipcode                :integer
#  file_id                :string
#  profession_id          :integer
#  distance_id            :integer
#  job_id                 :integer
#  finished               :boolean
#

# if Job.profession == lawn
#   categories = @categories
# else
#   categories = @categories


class Job < ActiveRecord::Base
  belongs_to :laborer
  belongs_to :client
  belongs_to :category
  belongs_to :profession

  has_one :selected_submission
  has_many :submissions
  has_many :images, dependent: :destroy
  belongs_to :selected_submission, class_name: "Submission"

  accepts_attachments_for :images, attachment: :file, append: true
  accepts_nested_attributes_for :images, allow_destroy: true

  default_scope { order('created_at DESC') }
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end

  def self.search(search)
    where("title LIKE ? OR description LIKE ? OR category_id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
