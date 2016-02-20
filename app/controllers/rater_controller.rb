class RaterController < ApplicationController

  def create
    if pundit_user?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, pundit_user, params[:dimension]

      render :json => true
    else
      render :json => false
    end
  end
  private

end
