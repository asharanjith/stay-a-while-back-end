require 'swagger_helper'

RSpec.describe 'home_stays', type: :request do
  path '/home_stays' do
    get('list home_stays') do
      tags 'Home Stays'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :my_home_stays, in: :query, type: :boolean, required: false
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
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
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
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
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete home_stay') do
      tags 'Home Stays'
      security [Bearer: []]
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
