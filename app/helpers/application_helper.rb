module ApplicationHelper
  def page_title(title)
    if title.empty?
      Stask::Application.config.title
    else
      "#{title} | #{Stask::Application.config.title}"
    end
  end
end
