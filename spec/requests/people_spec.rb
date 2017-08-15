require 'rails_helper'

RSpec.describe 'People', type: :request do

  let(:user) { FactoryGirl.create(:user, email: 'test@test.com', password: '12345678', password_confirmation: '12345678') }

  before :each do
    sign_in user
  end

  describe 'GET /people_search' do
    before do
      FactoryGirl.create(:person, name: 'Pablo', last_name: 'Escobar')
      FactoryGirl.create(:person, name: 'Pablo', last_name: 'Medina')
      FactoryGirl.create(:person, name: 'Enrique', last_name: 'Iglesias')

      get '/people_search', params: { q: 'Pablo', format: :json}, headers: { 'Accept': 'application/vnd' }
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns search results in JSON format' do
      results = json_response.map { |result| result[:full_name] }
      expect(results).to eq(['Pablo Escobar', 'Pablo Medina'])
    end


  end
end