class submitsController < ApplicationController
 def new
  @job = Job.find_by(params[:id])
  @laborer = current_laborer
end

end
