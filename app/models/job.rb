# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  job_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  laborer_id  :integer
#  client_id   :integer
#  category_id :integer
#

class Job < ActiveRecord::Base
  belongs_to :laborer
  belongs_to :client
  belongs_to :category
  has_many :submits, :as => :submittable
  accepts_nested_attributes_for :submits

  default_scope { order('created_at DESC') }

end
