# == Schema Information
#
# Table name: professions
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profession < ActiveRecord::Base
end
