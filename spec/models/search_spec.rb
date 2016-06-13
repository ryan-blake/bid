# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  keywords   :string
#  category   :string
#  min_price  :decimal(, )
#  max_price  :decimal(, )
#  distance   :decimal(, )
#  days       :decimal(, )
#  images     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Search, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
