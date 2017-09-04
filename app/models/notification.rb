class Notification < ApplicationRecord
  after_create :mail_notification

  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  private

  def mail_notification
    NotificationMailer.notification_email(self.recipient, self).deliver_now
  end

end
