require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [Bearer: []]
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

  path '/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete reservation') do
      tags 'Reservations'
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
