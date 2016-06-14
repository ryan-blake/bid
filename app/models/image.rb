# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  file_id    :string
#  job_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  belongs_to :job
  attachment :file

end
