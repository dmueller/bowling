module ApplicationHelper

  def title
    base_title = "bowling"
    if @title.nil? or @title.empty?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

end
