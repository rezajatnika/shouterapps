module ApplicationHelper
  # Title helper
  def full_title(page_title = '')
    base_title = 'Shouter'
    page_title.empty? ? base_title : "#{page_title} | #{base_title} "
  end
end
