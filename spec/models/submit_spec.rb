# == Schema Information
#
# Table name: submits
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  laborer_id :integer
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Submit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
