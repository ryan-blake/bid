# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  laborer_id :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Submission < ActiveRecord::Base
  belongs_to :job
  belongs_to :laborer
  belongs_to :submittable, polymorphic: true

  def pretty_print
    " $#{price}.00 by " 
  end
  def link_laborers
     link_to laborer.name, laborer
  end
end
