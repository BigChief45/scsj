class TrialPresentation < ApplicationRecord
  after_create :create_notifications

  mount_uploaders :attachments, AttachmentUploader

  validates :description, presence: true

  belongs_to :trial
  belongs_to :user

  private

  def recipients
    [self.trial.judge, self.trial.plaintiffs_lawyer, self.trial.defendants_lawyer] - [self.user]
  end

  def create_notifications
    recipients.each do |recipient|
      Notification.create(recipient: recipient, actor: self.user,
        action: 'posted', notifiable: self)
    end
  end
end
