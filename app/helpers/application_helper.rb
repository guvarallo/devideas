module ApplicationHelper

  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}" 
  end

  def datetime(dt)
    if dt > Time.now.beginning_of_day
      "#{time_ago_in_words(dt)} ago"
    else
      dt.strftime("%A, %d %b %Y %l:%M %p %Z")
    end
  end
end
