module MessegasHelper

  def recipients_options
    s = ''
    Client.all.each do |user|
      s << "<option value='#{user.id}'>#{user.name}</option>"
    end
    Laborer.all.each do |user|
      s << "<option value='#{user.id}'>#{user.name}</option>"
    end
    s.html_safe
  end
end
