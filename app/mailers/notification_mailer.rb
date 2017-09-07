class NotificationMailer < ApplicationMailer
  default from: 'notificaciones@scsj.com'

  def notification_email(recipient, notification)
    @recipient = recipient
    @notification = notification

    # TODO: Fix URL for all notifiable types
    @url = trial_url(notification.notifiable)

    mail(to: @recipient.email, subject: t('email.notifications.subject'))
  end
end
