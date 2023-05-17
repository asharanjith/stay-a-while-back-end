require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [Bearer: []]
      response(200, 'successful') do
        before(:each) do
          @user = User.create(name: 'test2')
          post '/login', params: { name: 'test2' }
          @response_body = JSON.parse(response.body, symbolize_names: true)
        end
        let(:Authorization) { 'Bearer ' + @response_body[:token] }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: { type: :object,
                         properties: {
                           no_of_persons: { type: :integer },
                           start_date: { type: :string, format: :date },
                           end_date: { type: :string, format: :date },
                           home_stay_id: { type: :integer }
                         } }
        }
      }
      response(201, 'successful') do
        before(:each) do
          @user = User.create(name: 'test2')
          @home_stay = HomeStay.create(name: 'test', location: 'test', description: 'test', no_of_rooms: 1, rating: 1,
                                       price: 1, user_id: @user.id)
          post '/login', params: { name: 'test2' }
          @response_body = JSON.parse(response.body, symbolize_names: true)
        end
        let(:Authorization) { 'Bearer ' + @response_body[:token] }
        let(:reservation) do
          { reservation: { no_of_persons: 1, start_date: '2021-05-01', end_date: '2021-05-02',
                           home_stay_id: @home_stay.id } }
        end
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete reservation') do
      tags 'Reservations'
      security [Bearer: []]
      response(200, 'successful') do
        before(:each) do
          @user = User.create(name: 'test2')
          @home_stay = HomeStay.create(name: 'test', location: 'test', description: 'test', no_of_rooms: 1, rating: 1,
                                       price: 1, user_id: @user.id)
          @reservation = Reservation.create(no_of_persons: 1, start_date: '2021-05-01', end_date: '2021-05-02',
                                            home_stay_id: @home_stay.id, user_id: @user.id)
          post '/login', params: { name: 'test2' }
          @response_body = JSON.parse(response.body, symbolize_names: true)
        end
        let(:Authorization) { 'Bearer ' + @response_body[:token] }
        let(:id) { @reservation.id }
        run_test!
      end
    end
  end
end
