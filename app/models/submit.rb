class Submit < ActiveRecord::Base
  belongs_to :job
  belongs_to :laborer
end
