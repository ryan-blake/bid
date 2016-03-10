# == Schema Information
#
# Table name: selected_submissions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SelectedSubmission < ActiveRecord::Base
  has_many :jobs
  has_many :clients
  has_many :laborers
end
