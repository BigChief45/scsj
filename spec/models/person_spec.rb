require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:person)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :id_number }
    it { is_expected.to validate_uniqueness_of :id_number }
    it { is_expected.to validate_presence_of :birth_date }
  end

  context 'instance methods' do
    let(:person) { FactoryGirl.create(:person) }

    it 'returns the full name' do
      expect(person.full_name).to eq("#{person.name} #{person.last_name}")
    end
  end
end
