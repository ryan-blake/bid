# == Schema Information
#
# Table name: searches
#
#  id         :integer          not null, primary key
#  keywords   :string
#  category   :string
#  min_price  :decimal(, )
#  max_price  :decimal(, )
#  distance   :decimal(, )
#  days       :decimal(, )
#  images     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Search < ActiveRecord::Base


   def search_jobs
       jobs = Job.all
       jobs = jobs.where(["title LIKE ? OR description LIKE ?", "%#{keywords}", "%#{keywords}"]) if keywords.present?
       jobs = jobs.where(["job.category_id LIKE ?", "%#{category}"]) if category.present?
       jobs = jobs.where(["price >= ?", min_price]) if min_price.present?
       jobs = jobs.where(["price <= ?", max_price]) if max_price.present?
     return jobs
   end


end
