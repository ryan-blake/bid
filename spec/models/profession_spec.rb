# == Schema Information
#
# Table name: professions
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Profession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
