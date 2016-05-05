class Image < ActiveRecord::Base
  belongs_to :job
  attachment :file
end
