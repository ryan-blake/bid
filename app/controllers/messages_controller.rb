class MessagesController < ApplicationController
  def new
        # allows only messages to be started with laborers unless selected. make available for laborers to ask question on jobs.
        # remove drop down list of recipients from new message show.
    # @chosen_recipient = Client.find_by(id: params[:to].to_i) && Client.find_by(id: params[:to].to_i) if params[:to]
    @chosen_recipient = Laborer.find_by(id: params[:to].to_i) if params[:to]


  end

  def create
    recipients = Laborer.where(id: params['recipients']) || Client.where(id: params['recipients'])
    conversation = pundit_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
