class Trial < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validate :lawyers_are_not_equal

  has_many :trial_people
  has_many :plaintiffs, source: :triable, source_type: 'Plaintiff', through: :trial_people
  has_many :defendants, source: :triable, source_type: 'Defendant', through: :trial_people
  has_many :trial_presentations, dependent: :destroy


  belongs_to :judge, class_name: 'User', foreign_key: :judge_id
  belongs_to :plaintiffs_lawyer, class_name: 'User', foreign_key: :plaintiffs_lawyer_id
  belongs_to :defendants_lawyer, class_name: 'User', foreign_key: :defendants_lawyer_id

  private

  def lawyers_are_not_equal
    if plaintiffs_lawyer == defendants_lawyer
      errors.add(:plaintiffs_lawyer, 'Abogado defensor no puede ser igual que el abogado demandante.')
      errors.add(:defendants_lawyer, 'Abogado demandante no puede ser igual que el abogado defensor.')
    end
  end
end
