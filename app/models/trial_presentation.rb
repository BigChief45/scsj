class TrialPresentation < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader

  validates :description, presence: true

  belongs_to :user#:lawyer, class_name: 'User', foreign_key: :lawyer_id
  belongs_to :trial
end
