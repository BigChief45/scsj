class TrialPerson < ApplicationRecord
  belongs_to :trial
  belongs_to :person
end
