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

require 'rails_helper'

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
