module ApplicationHelper
  
  def formatted_time(time)
    time.strftime("%d %b %Y @ %H:%M %p")
  end
end
