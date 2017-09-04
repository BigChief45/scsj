module ApplicationHelper

  def render_icon(icon_name, options)
    case options[:size]
    when :big
      image_tag("icons/32/#{icon_name}")
    when :small
      image_tag("icons/16/#{icon_name}")
    end
  end

end
