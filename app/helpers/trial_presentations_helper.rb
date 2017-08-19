module TrialPresentationsHelper

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
