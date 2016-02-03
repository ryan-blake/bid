# == Schema Information
#
# Table name: laborers
#
#  id                     :integer          not null, primary key
#  name                   :string
#  about                  :string
#  laborer_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#

require 'rails_helper'

RSpec.describe Laborer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
