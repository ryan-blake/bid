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

class Laborer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  has_many :clients, through: :jobs
end
