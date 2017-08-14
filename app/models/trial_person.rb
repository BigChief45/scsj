class TrialPerson < ApplicationRecord
  belongs_to :trial
  belongs_to :person
end

class Plaintiff < Person
end

class Defendant < Person
end
