class JobPolicy < ApplicationPolicy
  attr_reader :client, :job

  def initialize(client, job)
    @client = client
    @job = job
  end

  def show?
    if job.private
      client.present? && (client.premium? || client.admin?)
    else
      true
    end
  end

  def edit?
    update?
  end

  def update?
    client.present? && (client == job.client || client.admin?)
  end

  class Scope
    attr_reader :client, :scope

    def initialize(client, scope)
      @client = client
      @scope = scope
    end

    def resolve
      jobs = []
      if client.role == 'admin'
        jobs = scope.all # if the client is an admin, show them all the jobs
      elsif client.role == 'premium'
        all_jobs = scope.all
        all_jobs.each do |job|
          if job.public? || job.owner == client || job.collaborators.include?(client)
            jobs << job # if the client is premium, only show them public jobs, or that private jobs they created, or private jobs they are a collaborator on
          end
        end
      else # this is the lowly standard client
        all_jobs = scope.all
        jobs = []
        all_jobs.each do |job|
          if job.public? || job.collaborators.include?(client)
            jobs << job # only show standard clients public jobs and private jobs they are a collaborator on
          end
        end
      end
      jobs # return the jobs array we've built up
    end
  end


end
