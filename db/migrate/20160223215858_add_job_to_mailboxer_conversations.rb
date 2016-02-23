class AddJobToMailboxerConversations < ActiveRecord::Migration
  def change
    add_reference :mailboxer_conversations, :job, index: true, foreign_key: true
  end
end
