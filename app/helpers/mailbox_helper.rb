module MailboxHelper

  def unread_messages_count
    #number of unread msgs for current user
    mailbox.inbox(:unread => true).count(:id, :distinct => true)
  end
end
