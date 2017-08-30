require 'rails_helper'

RSpec.describe 'Notifications', type: :request do

  let(:user) { FactoryGirl.create(:user, :judge) }

  before :each do
    sign_in user
    FactoryGirl.create_list(:notification, 3, recipient: user)
  end

  describe 'GET /notifications.json' do
    before { get '/notifications.json', headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns notifications in JSON format' do
      expect(json_response.size).to eq(3)
    end
  end

  describe 'POST /notifications/mark_as_read' do
    before { post '/notifications/mark_as_read', params: { format: :json } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'clears all notifications' do
      expect(user.notifications.unread.size).to eq(0)
    end
  end

  describe 'POST /notifications/:id/mark_as_read' do
    before { post "/notifications/#{user.notifications.unread.first.id}/mark_as_read", params: {format: :json} }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'marks notifications as read' do
      expect(user.notifications.unread.size).to eq(2)
    end
  end

end