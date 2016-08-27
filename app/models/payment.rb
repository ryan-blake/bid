class Payment < ActiveRecord::Base
  belongs_to :client
  belongs_to :laborer
  belongs_to :job
end
