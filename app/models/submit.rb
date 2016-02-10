class Submit < ActiveRecord::Base
  belongs_to :job
  belongs_to :laborer
  belongs_to :submittable, polymorphic: true
end
