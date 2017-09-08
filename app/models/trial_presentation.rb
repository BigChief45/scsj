class TrialPresentation < ApplicationRecord

  belongs_to :trial, counter_cache: true
  belongs_to :user

  validates :description, presence: true

  after_create :create_notifications

  mount_uploaders :attachments, AttachmentUploader


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
