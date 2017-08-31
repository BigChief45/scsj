class NotificationMailer < ApplicationMailer
  default from: 'notificaciones@scsj.com'

  def notification_email(recipient, notification)
    @recipient = recipient
    @notification = notification
    @url = url_for(notification.notifiable.trial)

    mail(to: @recipient.email, subject: t('email.notifications.subject'))
  end
end
