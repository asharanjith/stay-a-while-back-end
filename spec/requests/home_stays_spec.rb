require 'rails_helper'
RSpec.describe '/home_stays', type: :request do
  before(:example) do
    @user = User.create(name: 'test2')
    @home_stay = HomeStay.create(name: 'test', location: 'test', description: 'test', no_of_rooms: 1, rating: 1,
                                 price: 1, user_id: @user.id)
    post '/login', params: { name: 'test2' }
    @response_body = JSON.parse(response.body, symbolize_names: true)
  end
  let(:header) do
    { Authorization: "Bearer #{@response_body[:token]}" }
  end
  describe 'GET /index' do
    before(:example) do
      get home_stays_url, headers: header, as: :json
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'renders a JSON response with the new home_stay' do
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
  describe 'GET /show' do
    before(:example) do
      get home_stay_url(@home_stay), headers: header, as: :json
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'renders a JSON response with the new home_stay' do
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
  describe 'POST /create' do
    before(:example) do
      post home_stays_url,
           params: { home_stay: { name: 'test', location: 'test',
                                  description: 'test', no_of_rooms: 1, rating: 1, price: 1, user_id: @user.id },
                     images: ['asdasd'] }, headers: header, as: :json
    end
    it 'creates a new HomeStay' do
      expect(HomeStay.count).to eq(2)
    end
    it 'request status is 201' do
      expect(response).to have_http_status(:created)
    end
    it 'renders a JSON response with the new home_stay' do
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
  describe 'destroy' do
    before(:example) do
      delete home_stay_url(@home_stay), headers: header, as: :json
    end
    it 'destroys the requested home_stay' do
      expect(HomeStay.count).to eq(0)
    end
    it 'request status is 204' do
      expect(response).to have_http_status(:success)
    end
    it 'renders a JSON response with the new home_stay' do
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
end
