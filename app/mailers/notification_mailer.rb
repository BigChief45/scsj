class NotificationMailer < ApplicationMailer
  # Hash of default values for any e-mail sent from this mailer
  default from: 'notificaciones@scsj.com'

  def notification_email(recipient, notification)
    @recipient = recipient
    @notification = notification
    @url = url_for(notification.notifiable.trial)

    mail(to: @recipient.email, subject: t('email.notifications.subject'))
  end
end
