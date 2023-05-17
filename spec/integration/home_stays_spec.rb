require 'swagger_helper'

RSpec.describe 'home_stays', type: :request do
  path '/home_stays' do
    get('list home_stays') do
      tags 'Home Stays'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :my_home_stays, in: :query, type: :boolean, required: false
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

    post('create home_stay') do
      tags 'Home Stays'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :home_stay, in: :body, schema: {
        type: :object,
        properties: {
          home_stay: { type: :object,
                       properties: {
                         name: { type: :string },
                         location: { type: :string },
                         description: { type: :string },
                         no_of_rooms: { type: :integer },
                         rating: { type: :integer },
                         price: { type: :integer }
                       } },
          images: { type: :array, items: { type: :string } }
        }
      }
      response(201, 'successful') do
        before(:each) do
          @user = User.create(name: 'test2')
          post '/login', params: { name: 'test2' }
          @response_body = JSON.parse(response.body, symbolize_names: true)
        end
        let(:Authorization) { 'Bearer ' + @response_body[:token] }
        let(:home_stay) do
          { home_stay: { name: 'test', location: 'test', description: 'test', no_of_rooms: 1, rating: 1, price: 1 },
            images: ['test'] }
        end
        run_test!
      end
    end
  end

  path '/home_stays/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show home_stay') do
      tags 'Home Stays'
      security [Bearer: []]
      response(200, 'successful') do
        before(:each) do
          @user = User.create(name: 'test2')
          post '/login', params: { name: 'test2' }
          @response_body = JSON.parse(response.body, symbolize_names: true)
        end
        let(:Authorization) { 'Bearer ' + @response_body[:token] }
        let(:id) do
          HomeStay.create(name: 'test', location: 'test', description: 'test', no_of_rooms: 1, rating: 1, price: 1,
                          user_id: @user.id).id
        end
        run_test!
      end
    end

    delete('delete home_stay') do
      tags 'Home Stays'
      security [Bearer: []]
      response(200, 'successful') do
        before(:each) do
          @user = User.create(name: 'test2')
          post '/login', params: { name: 'test2' }
          @response_body = JSON.parse(response.body, symbolize_names: true)
        end
        let(:Authorization) { 'Bearer ' + @response_body[:token] }
        let(:id) do
          HomeStay.create(name: 'test', location: 'test', description: 'test', no_of_rooms: 1, rating: 1, price: 1,
                          user_id: @user.id).id
        end
        run_test!
      end
    end
  end
end
