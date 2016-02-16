class ConversationsController < ApplicationController

  def new
  end


  def create
    recipients = Laborer.where(id: conversation_params[:recipients])
    conversation = pundit_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(pundit_user)
    # mark conversation as read
    conversation.mark_as_read(pundit_user)
  end

  def reply
    pundit_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
  conversation.move_to_trash(pundit_user)
  redirect_to mailbox_inbox_path
  end

  def untrash
  conversation.untrash(pundit_user)
  redirect_to mailbox_inbox_path
  end




  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end


  def message_params
    params.require(:message).permit(:body, :subject)
  end
end
