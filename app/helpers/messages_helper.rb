module MessagesHelper

  def recipients_options(chosen_recipient = nil)
    s = ''
    selectors.each do |user|
      s << "<option value='#{user.id}' #{ 'selected' if chosen_recipient == user }>#{user.name}</option>"
    end
    s.html_safe
  end

  def selectors
     Client.all + Laborer.all
  end
end
