class Search < ActiveRecord::Base

  def search_jobs

    jobs = Job.all

    jobs = jobs.where(["title LIKE ? OR description LIKE ?", "%#{keywords}"]) if keywords.present
    jobs = jobs.where(["category LIKE ?", category]) if category.present?
    jobs = jobs.where(["price >= ?", min_price]) if min_price.present?
    jobs = jobs.where(["price <= ?", max_price]) if max_price.present?
    jobs = jobs.where(["distance LIKE ?", distance]) if distance.present?
    jobs = jobs.where(["days LIKE ?", category]) if days.present?
    jobs = jobs.where(["images LIKE ?", category]) if images.present?

    return jobs
  end

end
