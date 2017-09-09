class Notification < ApplicationRecord
  scope :unread, -> { where(read_at: nil) }

  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  after_create :mail_notification

  private

  def mail_notification
    # NOTE: Use the notifiable_type field as a symbol to determine mailer action
    action = (self.notifiable_type.underscore + '_notification').to_sym

    NotificationsMailer.with(notification: self).send(action).deliver_now
  end

end
