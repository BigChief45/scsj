class TrialPerson < ApplicationRecord
  belongs_to :trial
  belongs_to :triable, polymorphic: true
end

class Plaintiff < Person
end

class Defendant < Person
end
