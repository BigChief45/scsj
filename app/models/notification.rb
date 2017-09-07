class Notification < ApplicationRecord
  scope :unread, -> { where(read_at: nil) }

  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  after_create :mail_notification

  private

  def mail_notification
    NotificationMailer.notification_email(self.recipient, self).deliver_now
  end

end
