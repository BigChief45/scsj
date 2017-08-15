require 'rails_helper'

RSpec.describe TrialPerson, type: :model do

  context 'associations' do
    it { is_expected.to belong_to :trial }
    it { is_expected.to belong_to :triable }
  end

end
