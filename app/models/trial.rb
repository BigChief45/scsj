class Trial < ApplicationRecord
  enum trial_type: [:ordinary]

  belongs_to :judge, class_name: 'User', foreign_key: :judge_id
  belongs_to :plaintiffs_lawyer, class_name: 'User', foreign_key: :plaintiffs_lawyer_id
  belongs_to :defendants_lawyer, class_name: 'User', foreign_key: :defendants_lawyer_id

  has_many :trial_people
  has_many :plaintiffs, source: :triable, source_type: 'Plaintiff', through: :trial_people
  has_many :defendants, source: :triable, source_type: 'Defendant', through: :trial_people
  has_many :trial_presentations, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validate :lawyers_are_not_equal

  after_create :create_notifications


  def attachments
    # Gather attachments from all presentations
    self.trial_presentations.map { |tp| tp.attachments }.flatten
  end

  def number_of_attachments
    self.trial_presentations.reduce(0) { |sum, tp| sum + tp.attachments.count }
  end

  private

  def lawyers_are_not_equal
    if plaintiffs_lawyer == defendants_lawyer
      # TODO: Localize strings
      errors.add(:plaintiffs_lawyer, 'Abogado defensor no puede ser igual que el abogado demandante.')
      errors.add(:defendants_lawyer, 'Abogado demandante no puede ser igual que el abogado defensor.')
    end
  end

  def recipients
    [self.plaintiffs_lawyer, self.defendants_lawyer]
  end

  def create_notifications
    recipients.each do |recipient|
      Notification.create(recipient: recipient, actor: self.judge,
        action: 'posted', notifiable: self)
    end
  end
end
