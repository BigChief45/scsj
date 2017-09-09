class NotificationsMailerPreview < ActionMailer::Preview

  def trial_notification_preview
    notification = Notification.new(recipient: User.first, actor: User.last,
      action: 'posted', notifiable: Trial.first)

    NotificationsMailer.with(notification: notification).
      trial_notification
  end

  def trial_presentation_notification_preview
    notification = Notification.new(recipient: User.first, actor: User.last,
      action: 'posted', notifiable: TrialPresentation.first)

    NotificationsMailer.with(notification: notification).
      trial_presentation_notification
  end

end