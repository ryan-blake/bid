# == Schema Information
#
# Table name: laborers
#
#  id         :integer          not null, primary key
#  name       :string
#  about      :string
#  laborer_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Laborer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
