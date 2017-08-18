class TrialPresentation < ApplicationRecord

  validates :description, presence: true

  belongs_to :lawyer, class_name: 'User', foreign_key: :lawyer_id
  belongs_to :trial
end
