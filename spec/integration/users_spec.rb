require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/users' do
    post('create user') do
      tags 'Account'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: { type: :object,
                  properties: {
                    name: { type: :string }
                  } }
        },
        required: ['name']
      }
      response(201, 'successful') do
        let(:user) { { user: { name: 'test' } } }
        run_test!
      end
    end
  end

  path '/login' do
    post('login user') do
      tags 'Account'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }
      response(200, 'successful') do
        before(:each) do
          User.create(name: 'test1')
        end
        let(:user) { { name: 'test1' } }
        run_test!
      end
    end
  end
end
