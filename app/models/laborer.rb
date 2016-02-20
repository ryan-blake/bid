# == Schema Information
#
# Table name: laborers
#
#  id                     :integer          not null, primary key
#  name                   :string
#  about                  :string
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
#  role                   :integer
#

class Laborer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rateable "professionalism"

  has_many :jobs
  has_many :clients, through: :jobs
  enum role: [:standard, :premium, :admin]
  has_many :submits, :as => :submittable


  def init
    self.role  ||= "standard"          #will set the default value only if it's nil
  end

  acts_as_messageable

def mailboxer_name
  self.name
end

def mailboxer_email(object)
  self.email
end

def current_user
  current_client || pundit_user
end

end
