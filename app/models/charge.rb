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

class Charge < ActiveRecord::Base
  belongs_to :client
  belongs_to :laborer
end
