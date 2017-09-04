module TrialPresentationsHelper

  def new_presentation_icon(options={})
    render_icon('page_add.png', options)
  end

  def presentation_notification_icon(options={})
    render_icon('document_quote.png', options)
  end

  def attachment_icon(identifier)
    case identifier.split('.').last
    when 'txt', 'doc', 'pdf'
      'page_white_text.png'
    when 'jpg', 'jpeg', 'png'
      'picture.png'
    else
      ''
    end
  end

end
