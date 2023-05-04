require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      before (:example) do
        post users_url, params: { user: {name: 'test'} }
      end
      it 'creates a new User' do
        expect(User.count).to eq(1)
      end

      it 'request status is 201' do
        expect(response).to have_http_status(:created)
      end

      it 'renders a JSON response with the new user' do
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      before (:example) do
        post users_url, params: { user: {name: 'te'} }
      end
      it 'does not create a new User' do
        expect(User.count).to eq(0)
      end

      it 'request status is 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders a JSON response with errors for the new user' do
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'POST /login' do
    context 'with valid parameters' do
      before (:example) do
        post users_url, params: { user: {name: 'test'} }
        post '/login', params: { name: 'test' }
      end
      it 'provides a token' do
        expect(response.body).to match(a_string_including('token'))
      end
      it 'request status is 200' do
        expect(response).to have_http_status(:ok)
      end
      it 'renders a JSON response with the new user' do
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
    context 'with invalid parameters' do
      before (:example) do
        post users_url, params: { user: {name: 'test'} }
        post '/login', params: { name: 'test2' }
      end
      it 'does not provide a token' do
        expect(response.body).to match(a_string_including('error'))
      end

      it 'request status is 401' do
        expect(response).to have_http_status(:unauthorized)
      end
      it 'renders a JSON response with the new user' do
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
