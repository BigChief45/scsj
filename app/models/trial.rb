class Trial < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
end