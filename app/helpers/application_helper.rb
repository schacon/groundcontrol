# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def spacer(height = 20)
    content_tag :div, ' ', :style => "height:#{height}px; clear:both;"
  end
end
