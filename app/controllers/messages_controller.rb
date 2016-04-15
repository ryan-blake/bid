class MessagesController < ApplicationController
  before_action :authenticate_client! || :authenticate_laborer!
  def new

    @chosen_recipient = Laborer.find_by(id: params[:to].to_i) if params[:to] || Client.find_by(id: params[:to].to_i) if params[:to]



  end

  def create
    recipients = Client.where(id: params['recipients']) || Laborer.where(id: params['recipients'])
    conversation = pundit_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
