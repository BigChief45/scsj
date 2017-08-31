class NotificationMailerPreview < ActionMailer::Preview

  def notification_email_preview
    NotificationMailer.notification_email(User.first, Notification.first)
  end

end