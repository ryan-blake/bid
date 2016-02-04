class AddLaborerRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :laborer, index: true, foreign_key: true
  end
end
