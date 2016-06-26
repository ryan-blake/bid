# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  client_id   :integer
#  laborer_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  job         :string
#  price       :integer
#  token       :string
#  customer_id :string
#  completed   :boolean
#

require 'rails_helper'

RSpec.describe Charge, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
