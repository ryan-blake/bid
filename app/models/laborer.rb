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
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :integer
#  latitude               :float
#  longitude              :float
#  address1               :string
#  address2               :string
#  city                   :string
#  state                  :string
#  zipcode                :integer
#

class Laborer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :jobs
  has_many :clients, through: :jobs
  enum role: [:standard, :premium, :admin]
  has_many :submits, :as => :submittable
  has_many :reviews
  #? submissions?
  # has_many :submissions
  has_one :selected_submission

  geocoded_by :full_address
  after_validation :geocode

  acts_as_messageable


  def full_address
    [address1, address2, city, state, zipcode].join(', ')
  end

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

end
