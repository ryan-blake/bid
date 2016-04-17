  class ConversationsController < ApplicationController
    before_action :get_mailbox
    before_action :get_conversation, except: [:index, :empty_trash]
    before_action :get_box, only: [:index]

    def index
      if @box.eql? "inbox"
        @conversations = @mailbox.inbox
      elsif @box.eql? "sent"
        @conversations = @mailbox.sentbox
      else
        @conversations = @mailbox.trash
      end

      @conversations = @conversations.paginate(page: params[:page], per_page: 10)
    end

    def show
    end

    def mark_as_read
      @conversation.mark_as_read(pundit_user)
      flash[:success] = 'The conversation was marked as read.'
      redirect_to conversations_path
    end

    def reply
      pundit_user.reply_to_conversation(@conversation, params[:body])
      flash[:success] = 'Reply sent'
      redirect_to conversation_path(@conversation)
    end

    def destroy
      @conversation.move_to_trash(pundit_user)
      flash[:success] = 'The conversation was moved to trash.'
      redirect_to conversations_path
    end

    def restore
      @conversation.untrash(pundit_user)
      flash[:success] = 'The conversation was restored.'
      redirect_to conversations_path
    end

    def empty_trash
      @mailbox.trash.each do |conversation|
        conversation.receipts_for(pundit_user).update_all(deleted: true)
      end
      flash[:success] = 'Your trash was cleaned!'
      redirect_to conversations_path
    end

    private

    def get_mailbox
      @mailbox ||= pundit_user.mailbox
    end

    def get_conversation
      @conversation ||= @mailbox.conversations.find(params[:id])
    end

    def get_box
      if params[:box].blank? or !["inbox","sent","trash"].include?(params[:box])
        params[:box] = 'inbox'
      end
      @box = params[:box]
    end
  end
# PRIOR TO REVAMPING::
#   def new
#     # @chosen_recipient_laborer = Laborer.find_by(id: params[@job.selected_submission.laborer.id].to_i) if params[:to]
#     # @chosen_recipient_client = Client.find_by(id: params[:to].to_i) if params[:to]
#
#
#   end
#
#
#   def create
#     recipients = Laborer.where(id: conversation_params[:recipients])
#     conversation = pundit_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
#     flash[:success] = "Your message was successfully sent!"
#     redirect_to conversation_path(conversation)
#   end
#
#   def show
#     @receipts = conversation.receipts_for(pundit_user)
#     # mark conversation as read
#     conversation.mark_as_read(pundit_user)
#   end
#
#   def reply
#     pundit_user.reply_to_conversation(conversation, message_params[:body])
#     flash[:notice] = "Your reply message was successfully sent!"
#     redirect_to conversation_path(conversation)
#   end
#
#   def trash
#   conversation.move_to_trash(pundit_user)
#   redirect_to mailbox_inbox_path
#   end
#
#   def untrash
#   conversation.untrash(pundit_user)
#   redirect_to mailbox_inbox_path
# #   end
# #
# #
# #
# #
# #   private
# #
# #   def conversation_params
# #     params.require(:conversation).permit(:subject, :body,recipients:[])
# #   end
# #
# #
# #   def message_params
# #     params.require(:message).permit(:body, :subject)
# #   end
# # end
# def index
#   @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
# end
#
# def show
#
# end
#
#
# private
#
#   def get_mailbox
#     @mailbox ||= pundit_user.mailbox
#   end
#
#   def get_conversation
#     @conversation ||= @mailbox.conversations.find(params[:id])
#   end
# end
