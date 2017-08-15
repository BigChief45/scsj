class Trial < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true

  has_many :trial_people
  has_many :plaintiffs, source: :triable, source_type: 'Plaintiff', through: :trial_people
  has_many :defendants, source: :triable, source_type: 'Defendant', through: :trial_people


  belongs_to :judge, class_name: 'User', foreign_key: :judge_id
end
