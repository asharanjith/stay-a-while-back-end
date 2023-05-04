require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/users').to route_to('users#create')
    end

    it 'routes to #login' do
      expect(post: '/login').to route_to('users#login')
    end
  end
end
