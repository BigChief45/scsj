class Trial < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true

  has_many :trial_people
  has_many :plaintiffs, class_name: 'Plaintiff', through: :trial_people, source: :person
  has_many :defendants, class_name: 'Defendant', through: :trial_people, source: :person

  attr_reader :plaintiff_tokens

  def plaintiff_tokens=(ids)
    self.plaintiff_ids = ids.split(',')
  end
end
