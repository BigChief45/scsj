class NotificationsMailer < ApplicationMailer
  before_action { @notification = params[:notification] }

  default from: 'notificaciones@scsj.com'

  def trial_notification
    @recipient = @notification.recipient
    @url = trial_url(@notification.notifiable)

    mail(to: @recipient.email, subject: t('email.notifications.subject'))
  end

  def trial_presentation_notification
    @recipient = @notification.recipient
    @url = trial_url(@notification.notifiable.trial)

    mail(to: @recipient.email, subject: t('email.notifications.subject'))
  end

end
