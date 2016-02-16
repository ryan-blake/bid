class MailboxController < ApplicationController
  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
    # raise
  end

  def trash
    @trash = mailbox.trash
    @active =  :trash
  end

end
