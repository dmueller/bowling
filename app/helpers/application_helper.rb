module ApplicationHelper

  def title
    base_title = "bowling"
    if @title.empty?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
